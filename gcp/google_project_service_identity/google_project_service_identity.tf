locals {
  services_map = {
    for i, s in var.services : i => s
  }
}

resource "google_project_service_identity" "this" {
  for_each = local.services_map
  provider = google-beta

  service = each.value
  project = var.project_id
}