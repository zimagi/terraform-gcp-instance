
variable "project" {
  description = "GCP project name"
}
variable "credentials" {
  description = "GCP service account credentials file in JSON format (needs ability to create networking, firewalls, and compute instances)"
  default = null
}

variable "active" {
  description = "Whether or not GCP instance is active"
  default     = true
}

variable "region" {
  description = "GCP region, e.g. us-east1"
  default     = "us-east1"
}
variable "vpc_name" {
  description = "VPC name"
  default     = "zimagi-test"
}
variable "subnet_name" {
  description = "VPC subnet name"
  default     = "public"
}
variable "subnet_cidr" {
  description = "VPC subnet CIDR"
  default     = "10.1.0.0/24"
}

variable "machine_type" {
  description = "GCP machine type"
  default     = "e2-standard-4"
}
variable "image" {
  description = "Image to build instance from in the format: image-family/os. See: https://cloud.google.com/compute/docs/images#os-compute-support"
  default     = "ubuntu-os-cloud/ubuntu-2204-lts"
}
variable "os_disk_size" {
  description = "Size of OS disk in GB"
  default     = "10"
}

variable "instance_name" {
  description = "GCP instance name"
  default     = "zimagi-test"
}

variable "instance_user" {
  description = "GCP instance username"
  default     = "ubuntu"
}
variable "instance_ssh_key" {
  description = "GCP instance public SSH key"
  default     = "~/.ssh/id_rsa.pub"
}
variable "firewall_access_cidr" {
  description = "GCP firewall access CIDR"
  default     = "0.0.0.0/0"
}

variable "command_api_port" {
  description = "Zimagi command API port"
  default     = "5123"
}
variable "data_api_port" {
  description = "Zimagi data API port"
  default     = "5323"
}

variable "labels" {
  type = map(string)
  default = {
    environment = "development"
    app         = "zimagi"
  }
}
