# Cluster GKE
resource "google_container_cluster" "gke" {
  name     = var.gke_name
  location = var.zone

  remove_default_node_pool = true
  initial_node_count       = 1

  networking_mode = "VPC_NATIVE"
  ip_allocation_policy {}

  release_channel {
    channel = "REGULAR"
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }
  deletion_protection = false
}

# Node pool
resource "google_container_node_pool" "default_pool" {
  name       = "${var.gke_name}-pool"
  location   = var.zone
  cluster    = google_container_cluster.gke.name
  node_count = 1

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    labels = {
      env = "gke"
    }
  }
}

# Registry Docker
resource "google_artifact_registry_repository" "docker_repo" {
  location      = var.region
  repository_id = "gke-apps"
  format        = "DOCKER"
  description   = "Repo docker pour les apps GKE"
}

# Compte de service pour Cloud Build
resource "google_service_account" "cb_deployer" {
  account_id   = "cloudbuild-deployer"
  display_name = "Cloud Build Deployer"
}

# Droits pour déployer sur GKE + pousser les images
resource "google_project_iam_member" "cb_gke_admin" {
  project = var.project_id
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.cb_deployer.email}"
}

resource "google_project_iam_member" "cb_artifact_writer" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.cb_deployer.email}"
}


