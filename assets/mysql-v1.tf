```terraform
# Define o recurso de banco de dados MySQL no Terraform
resource "mysql_database" "test" {
  name = "test"
}

# Define o recurso de usuário do banco de dados MySQL no Terraform
resource "mysql_user" "test" {
  name = "test"
  password = "password"

  # Concede privilégios totais ao usuário no banco de dados especificado
  privileges = ["ALL PRIVILEGES"]
  database = mysql_database.test.name
}

# Define o recurso de servidor de banco de dados MySQL no Terraform
resource "google_cloud_sql_database" "test" {
  name             = "test"
  database_version = "MYSQL_5_7"
  tier             = "db-custom-1-3840"
  # Tamanho do disco para ser alocado
  storage_auto_increase = true
  # Discagem para habilitar conexões internas e externas
  ip_configuration {
    ipv4_enabled = true
    authorized_networks = ["0.0.0.0/0"]
  }
  # Define o número de réplicas e a região para as réplicas
  replica_configuration {
    replica_count  = 1
    failover_target = false
  }
}

# Espera que o recurso do banco de dados seja criado
resource "google_cloud_sql_database" "wait_for_database" {
  depends_on = [google_cloud_sql_database.test]

  name = google_cloud_sql_database.test.name
}

# Exporta a URL de conexão do banco de dados MySQL
output "connection_url" {
  value = "${google_cloud_sql_database.test.connection_name}"
}