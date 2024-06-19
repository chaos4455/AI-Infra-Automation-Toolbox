# Definição do cluster MySQL usando o Terraform

resource "google_container_cluster" "mysql-cluster" {
  name     = "mysql-cluster"
  location = "us-central1"
  node_pools = [
    {
      name              = "default-pool"
      node_count        = 3
      machine_type      = "n1-standard-1"
      os_image          = "ubuntu"
      autoscaling       = {
        min_node_count  = 1
        max_node_count  = 5
      }
    }
  ]
  control_plane = {
    version = "1.19.2-gke.1900"
    # Fique à vontade para alterar a imagem do pool de controle se necessário.
    # Consulte a documentação do GKE para obter mais informações:
    # https://cloud.google.com/kubernetes-engine/docs/concepts/node-images
    #image = "gke-gcr-io/gke-control-plane-v1.19.2-gke.1900"
  }
  legacy_abac = {
    enabled = false
  }
  network_config = {
    pod_range = "10.244.0.0/14"
  }
}

resource "google_container_node_pool" "mysql-cluster-pool" {
  name        = "mysql-cluster-pool"
  location    = "us-central1"
  cluster     = google_container_cluster.mysql-cluster.name
  node_version    = "1.19.2-gke.1900"
  node_count  = 1
  # Fique à vontade para alterar a imagem do pool de controle se necessário.
  # Consulte a documentação do GKE para obter mais informações:
  # https://cloud.google.com/kubernetes-engine/docs/concepts/node-images
  #image = "gke-gcr-io/gke-nodepool-v1.19.2-gke.1900"
  autoscaling = {
    min_node_count  = 1
    max_node_count  = 3
  }
}

resource "google_service_account" "mysql-cluster-sa" {
  name = "mysql-cluster-sa"
  display_name = "Service account for MySQL cluster operations"
}

resource "google_service_account_key" "mysql-cluster-sa-key" {
  service_account_id = google_service_account.mysql-cluster-sa.id
  key_algorithm      = "RSA_4096"
  # Salve a chave JSON gerada por este recurso em um local seguro
  # para uso posterior na criação do cluster MySQL.
  private_key_type = "GOOGLE_CREDENTIALS_FILE"
}

resource "google_cloud_sql_instance" "mysql-primary" {
  name             = "mysql-primary"
  database_version = "MYSQL_8_0"
  backend_type     = "SECOND_GEN"
  machine_type     = "db-n1-standard-2"
  activation_policy = "ALWAYS"
  # Altere o root_password para uma senha forte e segura.
  root_password = "YOUR_STRONG_PASSWORD_HERE"
  hbr_enabled      = true
}

resource "google_cloud_sql_instance" "mysql-replica" {
  name             = "mysql-replica"
  database_version = "MYSQL_8_0"
  backend_type     = "SECOND_GEN"
  machine_type     = "db-n1-standard-2"
  activation_policy = "ALWAYS"
  # Altere o root_password para uma senha forte e segura.
  root_password = "YOUR_STRONG_PASSWORD_HERE"
  failover_replica  = {
    automatic = {
      seconds = 300
    }
  }
  replica_configuration = {
    source_instance = google_cloud_sql_instance.mysql-primary.name
    failover  = {
      automatic = {
        failover_timeout = "5s"
      }
    }
  }
}

# Crie um firewall para permitir o acesso a partir dos pods do cluster ao banco de dados MySQL.
resource "google_compute_firewall" "mysql-cluster-firewall" {
  name    = "mysql-cluster-firewall"
  network = "default"
  target_tags = ["mysql-cluster"]
  allowed = [
    {
      I_p_protocol  = "tcp"
      ports         = ["3306"]
      source_ranges = ["10.0.0.0/8"]
    }
  ]
}

# Crie um rótulo para os pods do cluster MySQL para permitir que o firewall os identifique.
resource "google_container_cluster_resource_label" "mysql-cluster-label" {
  cluster_id = google_container_cluster.mysql-cluster.id
  resource_labels = {
    "app" = "mysql-cluster"
  }
}

# Exponha serviços para acesso externo.
resource "google_service_networking_service" "mysql-service" {
  name    = "mysql"
  network = "default"
  ports   = ["3306"]
  selector = {
    "app" = "mysql-cluster"
  }
}
