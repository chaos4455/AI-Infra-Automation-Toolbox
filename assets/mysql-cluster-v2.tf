```
# Definição de recurso Terraform para um cluster MySQL

resource "google_container_cluster" "mysql-cluster" {
  name          = "mysql-cluster"
  description   = "Multizona avançado alta disponibilidade"
  location      = "us-central1"
  network       = "default"
  subnetwork    = "default"
  initial_node_count = 3
  node_pool {
    name     = "pool-0"
    node_count  = 3
    machine_type = "e2-standard-4"

    # Adicionar escopo do Cloud IAM para acesso ao Cloud SQL
    iam_instance_config {
      enabled = true
      service_account = "service-account-name@project-id.iam.gserviceaccount.com"
    }
  }

  master_authorized_networks_config {
    enabled = true
    cidr_blocks = ["10.0.0.0/24"]
  }

  autoscaling {
    min_node_count  = 2
    max_node_count  = 5
    autoscaling_metrics {
      utilization_target = 0.8
      metric = "cpu"
    }
  }

  monitoring_service = "monitoring.googleapis.com"
  logging_service    = "logging.googleapis.com"

  # Habilitar o gerenciamento de logs e métricas do Kubernetes
  addons_config {
    cloud_run_config {
      enabled = true
    }
    horizontal_pod_autoscaling {
      enabled = true
    }
    istio_config {
      enabled = true
    }
    network_policy_config {
      enabled = true
    }
  }
}

# Definição de recurso Terraform para um serviço de banco de dados MySQL
resource "google_sql_database" "mysql-instance" {
  name             = "mysql-instance"
  database_version = "MYSQL_8_0"
  machine_type     = "db-f1-micro"
  storage_auto_increase = true
  max_storage_gb    = 250
  backup_configuration {
    backup_location = "us-central1"
  }

  # Defina o IP e a porta para o endpoint do banco de dados
  ip    = "10.8.0.10"
  port  = 3306

  settings {
    # Habilite o acesso externo ao banco de dados
    ip_configuration {
      authorized_networks {
        name = "default"
        value = "10.0.0.0/24"
      }
    }
  }
}