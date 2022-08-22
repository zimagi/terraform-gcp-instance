
resource "google_compute_network" "vpc" {
  name                    = var.gcp_vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public" {
  name          = "${var.gcp_vpc_name}-${var.gcp_subnet_name}"
  network       = google_compute_network.vpc.name
  ip_cidr_range = var.gcp_subnet_cidr
}
