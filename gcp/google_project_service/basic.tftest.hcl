variables {
  disable_dependent_services = false
  disable_on_destroy         = false
  service                    = "serviceusage.googleapis.com"
}
run "test" {
  command = plan
  assert {
    condition     = google_project_service.this.service != null
    error_message = "google_project_service was not succesful"
  }
}
