resource "google_project_service" "this" {
  service = var.service

  disable_dependent_services = var.disable_dependent_services
  disable_on_destroy         = var.disable_on_destroy
}
