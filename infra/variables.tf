variable "project_id" {
  type = string
  default = "learned-dahlia-374710"
}

variable "region" {
  type    = string
  default = "europe-west1"
}

variable "zone" {
  type    = string
  default = "europe-west1-b"
}

variable "gke_name" {
  type    = string
  default = "gke-lab"
}
