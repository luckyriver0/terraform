resource "google_compute_firewall" "allow-http" {
  depends_on = ["google_compute_subnetwork.subnet1"]

  name    = "allow-http"
  network = "${google_compute_network.kpter_network.name}"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  target_tags = ["front"]
}

resource "google_compute_firewall" "allow-https" {
  depends_on = ["google_compute_subnetwork.subnet1"]

  name    = "allow-https"
  network = "${google_compute_network.kpter_network.name}"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  target_tags = ["front"]
}

resource "google_compute_firewall" "allow-ssh" {
  depends_on = ["google_compute_subnetwork.subnet1"]

  name    = "allow-ssh"
  network = "${google_compute_network.kpter_network.name}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  # TODO should restrict access
  source_ranges = ["0.0.0.0/0"]
}


resource "google_compute_firewall" "allow-icmp" {
  depends_on = ["google_compute_subnetwork.subnet1"]

  name    = "allow-icmp"
  network = "${google_compute_network.kpter_network.name}"

  allow {
    protocol = "icmp"
  }

  target_tags = ["front"]
}
