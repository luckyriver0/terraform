service_name = "kpter"
environment = "production"
env_prefix = "prod"
project = "gcp-sandbox-200912"
compute_engine_front {
  machine_type = "f1-micro"
  image = "coreos-stable-1688-5-3-v20180403"
}
cloud_storage_image_store {
  location = "ASIA"
  storage_class = "multi_regional"
}
cloud_sql_master {
  tier = "db-f1-micro"
  database_version = "MYSQL_5_7"
  # refer to environment variables
  # root_user = ""
  # root_password = ""
}
