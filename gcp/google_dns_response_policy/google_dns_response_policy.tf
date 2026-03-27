resource "google_dns_response_policy" "this" {
  description          = var.description
  response_policy_name = var.response_policy_name

  dynamic "gke_clusters" {
    for_each = var.gke_clusters
    content {
      gke_cluster_name = gke_clusters.value.gke_cluster_name
    }
  }

  dynamic "networks" {
    for_each = var.networks
    content {
      network_url = networks.value.network_url
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
