variables {
  bucket = "test-bucket"
  member = "user:test@example.com"
  role   = "roles/storage.objectViewer"

  condition = [{
    title       = "test_condition"
    expression  = "request.time < timestamp(\"2024-12-31T00:00:00Z\")"
    description = "Test condition for time-based access"
  }]
}

run "verify_storage_bucket_iam_member" {
  command = plan

  assert {
    condition     = google_storage_bucket_iam_member.this.role == "roles/storage.objectViewer"
    error_message = "IAM role does not match expected value"
  }
}