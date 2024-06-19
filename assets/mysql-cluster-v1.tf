```
variable "image" {}
variable "cpu" {
  default = 500
}
variable "memory" {
  default = 100
}
variable "replicas" {
  default = 2
}
variable "storage_class" {}
variable "storage_size" {
  default = 100
}
variable "name" {}
variable "namespace" {}

resource "kubernetes_deployment" "mysql-cluster" {
  name = var.name
  namespace = var.namespace
  replicas = var.replicas

  selector {
    match_labels = {
      app = var.name
    }
  }

  template {
    metadata {
      labels = {
        app = var.name
      }
    }

    spec {
      containers {
        name = "mysql"
        image = var.image
        resources {
          requests {
            cpu = "${var.cpu}m"
            memory = "${var.memory}Mi"
          }
        }
        volume_mounts {
          name = "data"
          mount_path = "/var/lib/mysql"
        }
      }
      volumes {
        name = "data"
        persistent_volume_claim {
          claim_name = "${var.name}-data"
        }
      }
    }
  }
}

resource "kubernetes_service" "mysql-cluster-service" {
  name = "${var.name}-service"
  namespace = var.namespace

  spec {
    type = "ClusterIP"

    selector {
      app = var.name
    }

    port {
      port = 3306
      target_port = 3306
    }
  }
}

resource "kubernetes_ingress" "mysql-cluster-ingress" {
  name = "${var.name}-ingress"
  namespace = var.namespace

  spec {
    tls {
      secret_name = "${var.name}-tls"
    }

    rule {
      host = "${var.name}.example.com"
      http {
        path {
          path = "/"
          backend {
            service {
              name = "${var.name}-service"
              port {
                number = 3306
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "mysql-cluster-pvc" {
  name = "${var.name}-data"
  namespace = var.namespace

  storage_class_name = var.storage_class
  access_modes = ["ReadWriteOnce"]
  resources {
    requests {
      storage = var.storage_size
    }
  }
}