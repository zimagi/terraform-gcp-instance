
terraform {
  required_version = ">= 0.13"
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}
