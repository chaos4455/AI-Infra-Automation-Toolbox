resource "kubernetes_service" "apache-cluster" {
  name                      = "apache-cluster"
  namespace                 = "default"
  type                      = "LoadBalancer"
  port_name                 = "http"
  port                      = 80
  target_port               = 80
  selector                  = {"app": "apache"}

  load_balancer_source_ranges = ["0.0.0.0/0"]
}

resource "kubernetes_deployment" "apache-cluster" {
  name = "apache-cluster"
  namespace = "default"
  image = "httpd:2.4"
  container_port = 80

  volume_mounts = [
    {
      name      = "apache-pvc"
      mount_path = "/var/www/html"
    }
  ]

}

resource "kubernetes_volume" "apache-pvc" {
  name = "apache-pvc"
  namespace = "default"

  persistent_volume_claim {
    access_modes = ["ReadWriteOnce"]
    storage_class_name = "standard"
    resources = {
      requests = {
        storage = "100Mi"
      }
    }
  }
}

resource "kubernetes_secret" "apache-secret" {
  name = "apache-secret"
  namespace = "default"

  string_data = {
    username = "user"
    password = "password"
  }
}

resource "kubernetes_config_map" "apache-config" {
  name = "apache-config"
  namespace = "default"

  data = {
    "index.html" = "<html><body><h1>Hello, Kubernetes!</h1></body></html>"
  }
}
