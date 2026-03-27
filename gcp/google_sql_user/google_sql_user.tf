resource "google_sql_user" "this" {
  name     = var.name
  instance = var.instance
  type     = var.type
  password = var.type == "CLOUD_IAM_USER" || var.type == "CLOUD_IAM_SERVICE_ACCOUNT" ? "" : var.password
  host     = var.host

  dynamic "password_policy" {
    for_each = var.password_policy

    content {
      allowed_failed_attempts      = password_policy.value.allowed_failed_attempts
      password_expiration_duration = password_policy.value.password_expiration_duration
      enable_failed_attempts_check = password_policy.value.enable_failed_attempts_check
      enable_password_verification = password_policy.value.enable_password_verification
    }
  }
}