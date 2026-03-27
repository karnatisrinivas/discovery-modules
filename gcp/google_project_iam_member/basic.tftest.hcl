variables {
  region = "us-west2"
  role   = "roles/firebase.admin"
  member = "serviceAccount:123456789012-compute@developer.gserviceaccount.com"
  condition = [
    {
      description = "Condition description"
      expression  = "request.time < timestamp(\"2030-12-31T00:00:00Z\")"
      title       = "condition_title"
    }
  ]
}

run "test" {
  command = apply

  assert {
    condition     = google_project_iam_member.this.role == "roles/firebase.admin"
    error_message = "google_project_iam_member did not create correctly"
  }
}