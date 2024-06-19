```terraform
resource "google_container_cluster" "mysql-cluster" {
  name = "mysql-cluster"
  location = "us-central1"
  # Use a versão mais recente do Kubernetes
  version = "1.23.4-gke.1000"

  # Cria um master pool com 3 nós
  master_auth {
    username = "admin"
    password = "passw0rd"
  }
  master_authorized_networks_config {
    cidr_blocks = ["10.0.0.0/24"]
  }
  node_pools {
    name       = "pool-0"
    node_count = 3
    # Use as máquinas e2-standard-4
    machine_type = "e2-standard-4"
  }
  addons_config {
    # Habilita o DNS do Kubernetes
    dns_cache_config {
      enabled = true
    }
    # Habilita o GKE Monitoring
    monitoring_config {
      enabled = true
    }
    # Habilita o GKE Logging
    logging_config {
      enabled = true
    }
  }
  # Cria uma rede customizada para o cluster
  network {
    name = "gke-cluster-network"
    subnetwork = "default"
  }
  # Cria um roteamento entre o cluster e a VPC
  private_cluster_config {
    enable_private_nodes = true
    enable_private_endpoint = true
    master_ipv4_cidr_block = "172.16.10.0/24"
  }

  # Define uma variável para a imagem do banco de dados MySQL
  variable "mysql_image" {
    default = "library/mysql:8.0"
  }

  # Cria um serviço para o banco de dados MySQL
  resource "google_container_cluster_service" "mysql-service" {
    cluster_id = google_container_cluster.mysql-cluster.id
    service {
      name = "mysql"
      ports {
        name       = "mysql"
        port       = 3306
        target_port = 3306
      }
      selector = {
        app = "mysql"
      }
    }
  }

  # Cria uma implantação para o banco de dados MySQL
  resource "google_container_cluster_deployment" "mysql-deployment" {
    cluster_id = google_container_cluster.mysql-cluster.id
    metadata {
      name = "mysql"
      labels = {
        app = "mysql"
      }
    }
    spec {
      replicas = 1
      selector {
        match_labels = {
          app = "mysql"
        }
      }
      template {
        metadata {
          labels = {
            app = "mysql"
          }
        }
        spec {
          volumes {
            name = "mysql-data"
            persistent_volume_claim {
              claim_name = "mysql-data"
            }
          }
          init_containers {
            name  = "init-mysqld"
            image = "gcr.io/google-containers/busybox"
            command = [
              "sh", "-c", "sed -i 's/innodb_flush_log_at_trx_commit=2/innodb_flush_log_at_trx_commit=0/' /etc/mysql/my.cnf && \
              sed -i 's/# slave_pending_jobs_size_max = 33554432/# slave_pending_jobs_size_max = 1073741824/' /etc/mysql/my.cnf && \
              sed -i 's/# binlog-rows-query-log-events = 1/# binlog-rows-query-log-events = 0/' /etc/mysql/my.cnf && \
              sed -i 's/# sync_binlog = 0/sync_binlog = 1/' /etc/mysql/my.cnf && \
              sed -i 's/# binlog_checksum = NONE/binlog_checksum = CRC32/' /etc/mysql/my.cnf && \
              sed -i 's/# binlog-transaction-dependency-tracking = WRITESET/# binlog-transaction-dependency-tracking = COMMIT_ORDER/' /etc/mysql/my.cnf && \
              sed -i 's/# expire_logs_days = 0/# expire_logs_days = 7/' /etc/mysql/my.cnf && \
              sed -i 's/# binlog_cache_size = 32768/# binlog_cache_size = 1048576/' /etc/mysql/my.cnf"
            ]
          }
          containers {
            name  = "mysql"
            image = var.mysql_image
            ports {
              name          = "mysql"
              container_port = 3306
            }
            volume_mounts {
              name      = "mysql-data"
              mount_path = "/var/lib/mysql"
            }
            env {
              MYSQL_ROOT_PASSWORD = "password"
              MYSQL_ROOT_HOST     = "%"
            }
            resources {
              limits {
                cpu    = "100m"
                memory = "512Mi"
              }
              requests {
                cpu    = "10m"
                memory = "128Mi"
              }
            }
          }
        }
      }
    }
  }

  # Cria um PersistentVolumeClaim para o banco de dados MySQL
  resource "google_container_cluster_persistent_volume_claim" "mysql-data" {
    cluster_id = google_container_cluster.mysql-cluster.id
    metadata {
      name = "mysql-data"
    }
    spec {
      storage_class_name = "standard"
      access_modes      = ["ReadWriteOnce"]
      resources {
        requests {
          storage = "1Gi"
        }
      }
    }
  }

  # Exibe o endereço IP externo do serviço
  output "mysql_endpoint" {
    value = google_container_cluster_service.mysql-service.endpoint
  }
}