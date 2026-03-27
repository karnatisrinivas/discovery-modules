resource "google_gke_hub_membership" "this" {
  membership_id = var.membership_id

  endpoint {
    gke_cluster {
      resource_link = "//container.googleapis.com/${var.cluster}"
    }
  }
}