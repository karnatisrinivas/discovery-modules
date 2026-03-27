variables {
  name     = "testuser"
  instance = "demo"
  type     = "CLOUD_IAM_USER"
  password = "hello"
  host     = ""

  password_policy = [{
    allowed_failed_attempts      = 1
    password_expiration_period   = 700
    enable_failed_attempts_check = true
    enable_password_verification = true
  }]
}

run "test" {
  command = plan
  assert {
    condition     = google_sql_user.this.name == "testuser"
    error_message = "google_sql_user did not create correctly"
  }
}