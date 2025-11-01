terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0.0"
    }
  }
}

provider "google" {
  project = "learned-dahlia-374710"
  region  = "europe-west1"
  zone    = "europe-west1-b"
  credentials = file("../../account.json")
}