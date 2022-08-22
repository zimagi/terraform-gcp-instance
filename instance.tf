
data "google_compute_zones" "available" {}

data "template_file" "startup_script" {
  template = "${file("${path.module}/startup.sh.tpl")}"
  vars     = {
    user = var.instance_user
  }
}

resource "google_compute_instance" "zimagi" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = data.google_compute_zones.available.names[0]

  tags         = ["allow-ssh", "allow-command-api", "allow-data-api"]
  labels       = var.labels

  allow_stopping_for_update = true

  boot_disk {
    source      = google_compute_disk.os_disk.name
    auto_delete = false
  }

  network_interface {
    subnetwork = google_compute_subnetwork.public.name

    access_config {}
  }

  metadata = {
    ssh-keys = "${var.instance_user}:${file(var.instance_ssh_key)}"
  }

   metadata_startup_script = "${data.template_file.startup_script.rendered}"
}

resource "google_compute_disk" "os_disk" {
  name   = var.instance_name
  zone   = data.google_compute_zones.available.names[0]
  type   = "pd-ssd"
  image  = var.image
  size   = var.os_disk_size
  labels = var.labels
}
