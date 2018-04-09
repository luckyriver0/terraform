variable service_name {
  default = "kpter"
}
variable environment {}
variable env_prefix {}
variable project {}
variable region {
  default = "asia-northeast1"
}
variable zone {
  default = "asia-northeast1-a"
}
variable domain {
  default = "kpter.net"
}
variable compute_engine_front {
  type = "map"
}
variable cloud_storage_image_store {
  type = "map"
}
variable cloud_sql_master {
  type = "map"
}
