
resource "google_compute_firewall" "ssh" {
  name = "allow-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.vpc.name
  priority      = 1000
  source_ranges = [var.subnet_cidr, var.firewall_access_cidr]
  target_tags   = ["allow-ssh"]
}

resource "google_compute_firewall" "command_api" {
  name = "allow-command-api"
  allow {
    ports    = [var.command_api_port]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.vpc.name
  priority      = 1050
  source_ranges = [var.subnet_cidr, var.firewall_access_cidr]
  target_tags   = ["allow-command-api"]
}

resource "google_compute_firewall" "data_api" {
  name = "allow-data-api"
  allow {
    ports    = [var.data_api_port]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.vpc.name
  priority      = 1050
  source_ranges = [var.subnet_cidr, var.firewall_access_cidr]
  target_tags   = ["allow-data-api"]
}
