resource "google_sql_database" "database-tf" {
  name     = var.database-tf
  instance = google_sql_database_instance.instance-sql-tf.name
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "instance-sql-tf" {
  name   = var.instance-sql-tf
  region = var.region


  database_version = var.database_version
  settings {
    tier              = var.tier
    availability_type = var.availability_type
    backup_configuration {
      enabled            = var.enabled
      binary_log_enabled = var.binary_log_enabled
    }
  }

  deletion_protection = false
}

resource "google_sql_user" "users" {
  name     = var.users
  instance = google_sql_database_instance.instance-sql-tf.name
  host     = var.host
  password = var.password

}