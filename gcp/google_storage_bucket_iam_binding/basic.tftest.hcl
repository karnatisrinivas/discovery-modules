variables {
  bucket  = "projects/my-project/serviceAccounts/my-service-account@my-project.iam.gserviceaccount.com"
  role    = "roles/iam.serviceAccountUser"
  members = ["user:jane@example.com"]
  condition = [{
    title       = "expires_after_2019_12_31"
    description = "Expiring at midnight of 2019-12-31"
    expression  = "request.time < timestamp(\"2020-01-01T00:00:00Z\")"
  }]
}

run "test" {
  command = plan

  assert {
    condition     = google_storage_bucket_iam_binding.this.service_account_id == "projects/my-project/serviceAccounts/my-service-account@my-project.iam.gserviceaccount.com"
    error_message = "google_storage_bucket_iam_binding did not create correctly"
  }
}