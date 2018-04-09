resource "google_sql_database_instance" "master" {
  name = "${var.env_prefix}-${var.service_name}-db"
  database_version = "${var.cloud_sql_master["database_version"]}"
  region = "${var.region}"

  settings {
    tier = "${var.cloud_sql_master["tier"]}"
  }
}

resource "google_sql_database" "kpter-db" {
  name      = "${var.service_name}_${var.environment}"
  instance  = "${google_sql_database_instance.master.name}"
  charset   = "utf8mb4"
  collation = "utf8mb4_bin"
}

resource "google_sql_user" "root" {
  name     = "${var.cloud_sql_master["root_user"]}"
  instance = "${google_sql_database_instance.master.name}"
  password = "${var.cloud_sql_master["root_password"]}"
}

resource "google_sql_user" "app" {
  name     = "${var.service_name}"
  instance = "${google_sql_database_instance.master.name}"
  host     = "'${var.service_name}'@'cloudsqlproxy~%'"
}
