```
resource "kubernetes_namespace" "nginx-cluster-load-balance" {
  metadata {
    name = "nginx-cluster-load-balance"
  }
}

resource "kubernetes_service" "nginx-cluster-load-balance" {
  metadata {
    name      = "nginx-cluster-load-balance"
    namespace = "nginx-cluster-load-balance"
  }

  spec {
    selector = {
      app = "nginx"
    }

    ports {
      port        = 80
      target_port = "http"
    }
  }
}

resource "kubernetes_ingress" "nginx-cluster-load-balance" {
  metadata {
    name      = "nginx-cluster-load-balance"
    namespace = "nginx-cluster-load-balance"
  }

  spec {
    tls {
      secret_name = "my-secret"
    }

    rules {
      host = "nginx-cluster-load-balance.example.com"

      http {
        paths {
          path = "/"

          backend {
            service_name = "nginx-cluster-load-balance"
            service_port = "http"
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = "nginx"
    namespace = "nginx-cluster-load-balance"
  }

  spec {
    selector {
      match_labels = {
        app = "nginx"
      }
    }

    replicas = 40

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        containers {
          name    = "nginx"
          image   = "nginx:1.17-alpine"
          command = ["/bin/sh", "-c", "exec nginx -g 'daemon off;'"]
          ports {
            name          = "http"
            container_port = 80
          }
        }
      }
    }
  }
}