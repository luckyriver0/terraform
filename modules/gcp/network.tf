resource "google_compute_network" "kpter_network" {
  name = "${var.env_prefix}-${var.service_name}-network"
}

resource "google_compute_subnetwork" "subnet1" {
  name          = "subnet1"
  ip_cidr_range = "192.168.10.0/24"
  network       = "${google_compute_network.kpter_network.name}"
  description   = "${var.env_prefix}-${var.service_name}-subnetwork"
  region        = "${var.region}"
}
