variables {
  service_account_id = "projects/my-project/serviceAccounts/my-service-account@my-project.iam.gserviceaccount.com"
  role               = "roles/iam.serviceAccountUser"
  members            = ["user:jane@example.com"]
}

run "test" {
  command = plan

  assert {
    condition     = google_service_account_iam_binding.this.service_account_id == "projects/my-project/serviceAccounts/my-service-account@my-project.iam.gserviceaccount.com"
    error_message = "google_service_account_iam_binding did not create correctly"
  }
}