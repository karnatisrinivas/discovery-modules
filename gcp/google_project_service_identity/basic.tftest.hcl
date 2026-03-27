variables {
  services = ["healthcare.googleapis.com"]
}

run "test" {
  command = plan

  assert {
    condition     = google_project_service_identity.this[0].service == "healthcare.googleapis.com"
    error_message = "google_project_service_identity did not create correctly"
  }
}