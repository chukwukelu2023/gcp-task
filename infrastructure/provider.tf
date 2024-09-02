terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>5.25.0"
    }
  }

  backend "gcs" {
    bucket = "ikeike"
    prefix = "terraform/state"
  }
}



provider "google" {
  project = var.project-id
  region  = var.region
}