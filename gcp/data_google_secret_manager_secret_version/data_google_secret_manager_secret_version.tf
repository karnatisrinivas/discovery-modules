data "google_secret_manager_secret_version" "this" {
  is_secret_data_base64 = var.is_secret_data_base64
  secret                = var.secret
  version               = var.google_secret_manager_secret_version_version

}
