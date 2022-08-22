
output "instance_id" {
  value = google_compute_instance.zimagi.instance_id
}

output "external_ip" {
  value = google_compute_instance.zimagi.network_interface.0.access_config.0.nat_ip
}
output "internal_ip" {
  value = google_compute_instance.zimagi.network_interface.0.network_ip
}

output "ssh_access_location" {
    value = "${var.instance_user}@${google_compute_instance.zimagi.network_interface.0.access_config.0.nat_ip}"
}

output "zimagi_command_api" {
    value = "https://${google_compute_instance.zimagi.network_interface.0.access_config.0.nat_ip}:${var.command_api_port}/"
}
output "zimagi_data_api" {
    value = "https://${google_compute_instance.zimagi.network_interface.0.access_config.0.nat_ip}:${var.data_api_port}/"
}
