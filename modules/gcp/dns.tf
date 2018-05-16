resource "google_dns_managed_zone" "prod" {
  name        = "${var.env_prefix}-${var.service_name}-zone"
  dns_name    = "${var.domain}."
  description = "${var.service_name} DNS zone"
}

resource "google_dns_record_set" "front" {
  name = "front.${google_dns_managed_zone.prod.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = "${google_dns_managed_zone.prod.name}"

  rrdatas = ["${google_compute_instance.front.network_interface.0.access_config.0.assigned_nat_ip}"]
}
