```hcl
# Provider definition
provider "google" {
  project = var.project_id
  zone    = var.zone
}

# Network definition
resource "google_compute_network" "default" {
  name = "default-network"
}

# Subnetwork definition
resource "google_compute_subnetwork" "default" {
  name          = "default-subnetwork"
  network       = google_compute_network.default.name
  private_ip_range = "10.128.0.0/24"
}

# Firewall rule definition
resource "google_compute_firewall" "default" {
  name        = "default-firewall"
  network     = google_compute_network.default.name
  allow {
    protocol = "tcp"
    port     = "3306"
  }
  target_tags = ["mysql"]
}

# Cloud SQL instance definition
resource "google_cloud_sql_instance" "primary" {
  name             = "primary"
  database_version = "MYSQL_8_0"
  machine_type     = "e2-standard-4"
  backup_enabled   = true
  gce_zone        = var.zone
  network          = google_compute_network.default.name
  subnetwork       = google_compute_subnetwork.default.name
  settings {
    availability_type = "ZONAL"
    ip_configuration {
      ipv4_enabled = true
    }
    data_disk {
      size_gb = 10
      type    = "PD_STANDARD"
    }
  }
}

# Cloud SQL instance definition
resource "google_cloud_sql_instance" "replica" {
  name             = "replica"
  database_version = "MYSQL_8_0"
  machine_type     = "e2-standard-4"
  backup_enabled   = true
  gce_zone        = var.zone
  network          = google_compute_network.default.name
  subnetwork       = google_compute_subnetwork.default.name
  settings {
    availability_type = "ZONAL"
    ip_configuration {
      ipv4_enabled = true
    }
    data_disk {
      size_gb = 10
      type    = "PD_STANDARD"
    }
  }
  replica_configuration {
    source_instance = google_cloud_sql_instance.primary.id
  }
}