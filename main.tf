provider "google" {
  # credentials = "${file("/path/to/account.json")}"  # refer to environment variables
  project = "${var.project}"
  region = "${var.region}"
}

terraform {
  backend "gcs" {
    bucket  = ""  # refer to args -backend-config
    prefix  = ""  # refer to args -backend-config
  }
}

module "kpter-infrastructure" {
  source = "./modules/gcp"

  service_name = "${var.service_name}"
  environment = "${var.environment}"
  env_prefix = "${var.env_prefix}"
  project = "${var.project}"
  region = "${var.region}"
  zone = "${var.zone}"

  compute_engine_front {
    machine_type = "${var.compute_engine_front["machine_type"]}"
    image = "${var.compute_engine_front["image"]}"
  }

  cloud_storage_image_store {
    location = "${var.cloud_storage_image_store["location"]}"
    storage_class = "${var.cloud_storage_image_store["storage_class"]}"
  }

  cloud_sql_master {
    tier = "${var.cloud_sql_master["tier"]}"
    database_version = "${var.cloud_sql_master["database_version"]}"
    root_user = "${var.cloud_sql_master["root_user"]}"    # refer to environment variables
    root_password = "${var.cloud_sql_master["root_password"]}"    # refer to environment variables
  }
}
