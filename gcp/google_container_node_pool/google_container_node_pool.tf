resource "google_container_node_pool" "this" {
  name       = var.name
  cluster    = var.cluster
  node_count = var.node_count

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = var.service_account
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  dynamic "management" {
    for_each = var.management
    content {
      auto_repair  = management.value.auto_repair
      auto_upgrade = management.value.auto_upgrade
    }
  }
}