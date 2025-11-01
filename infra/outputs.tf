output "cluster_name" {
  value = google_container_cluster.gke.name
}

output "docker_repo" {
  value = google_artifact_registry_repository.docker_repo.id
}

output "cloudbuild_sa" {
  value = google_service_account.cb_deployer.email
}
