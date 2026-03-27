variables {
  account_id                   = "account"
  display_name                 = "name"
  description                  = "a service account"
  disabled                     = false
  create_ignore_already_exists = true
}

run "test" {
  command = plan

  assert {
    condition     = google_service_account.this.account_id == "account"
    error_message = "google_service_account did not create correctly"
  }
}