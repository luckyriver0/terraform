resource "google_storage_bucket" "image_store" {
  name = "${var.env_prefix}-${var.service_name}-public"
  location = "${var.cloud_storage_image_store["location"]}"
  storage_class = "${var.cloud_storage_image_store["storage_class"]}"
}
