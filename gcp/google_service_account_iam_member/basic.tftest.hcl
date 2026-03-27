variables {
  service_account_id = "projects/my-project/serviceAccounts/my-service-account@my-project.iam.gserviceaccount.com"
  role               = "roles/iam.serviceAccountUser"
  member             = "user:jane@example.com"

  condition_title       = "expires_after_2019_12_31"
  condition_expression  = "request.time < timestamp(\"2020-01-01T00:00:00Z\")"
  condition_description = "Expiring at midnight of 2019-12-31"
}

run "test" {
  command = plan

  assert {
    condition     = google_service_account_iam_member.this.service_account_id == "projects/my-project/serviceAccounts/my-service-account@my-project.iam.gserviceaccount.com"
    error_message = "google_service_account_iam_member did not create correctly"
  }
}