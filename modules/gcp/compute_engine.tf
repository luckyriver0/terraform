resource "google_compute_address" "front" {
  name = "${var.env_prefix}-${var.service_name}-front"
  region = "${var.region}"
}

resource "google_compute_instance" "front" {
  name = "${var.env_prefix}-${var.service_name}-front"
  machine_type = "${var.compute_engine_front["machine_type"]}"
  zone = "${var.zone}"

  tags = ["${var.environment}", "${var.service_name}", "front"]

  boot_disk {
    initialize_params {
      image = "${var.compute_engine_front["image"]}"
    }
  }
  network_interface {
    subnetwork = "${google_compute_subnetwork.subnet1.name}"
    access_config {
      nat_ip = "${google_compute_address.front.address}"
    }
  }
}
