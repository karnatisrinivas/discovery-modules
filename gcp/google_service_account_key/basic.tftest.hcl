variables {
  service_account_id = "service account"
  public_key_type    = "TYPE_RAW_PUBLIC_KEY"
}

run "test" {
  command = plan

  assert {
    condition     = google_service_account_key.this.service_account_id == "service account"
    error_message = "google_service_account_key did not create correctly"
  }
}