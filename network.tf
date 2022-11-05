
resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public" {
  name          = "${var.vpc_name}-${var.subnet_name}"
  network       = google_compute_network.vpc.name
  ip_cidr_range = var.subnet_cidr
}
