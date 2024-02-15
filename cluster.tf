
/*
resource "google_container_cluster" "primary-cluster" {
  name     = var.primary-cluster
  location = var.zone


  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = var.node_config
  initial_node_count       = var.node_count
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.primary_preemptible_nodes
  location   = var.zone
  cluster    = google_container_cluster.primary-cluster.name
  node_count = var.node_count

  node_config {
    preemptible  = var.node_config
    machine_type = var.machine_type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.sa_tf.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
*/