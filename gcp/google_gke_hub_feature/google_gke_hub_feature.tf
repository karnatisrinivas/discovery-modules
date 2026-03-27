resource "google_gke_hub_feature" "this" {
  location = var.location
  name     = var.name
}