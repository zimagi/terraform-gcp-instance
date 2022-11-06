output "zimagi_host" {
  value = google_compute_instance.zimagi.network_interface.0.access_config.0.nat_ip
}
output "zimagi_command_port" {
  value = var.command_api_port
}
output "zimagi_data_port" {
  value = var.data_api_port
}

output "ssh_host" {
  value = google_compute_instance.zimagi.network_interface.0.access_config.0.nat_ip
}
output "ssh_port" {
  value = 22
}
output "ssh_user" {
  value = var.instance_user
}
