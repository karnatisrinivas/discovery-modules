resource "google_logging_project_bucket_config" "this" {
  project          = var.project_id
  location         = var.location
  bucket_id        = var.bucket_id
  retention_days   = var.retention_days
  locked           = var.locked
  description      = var.description
  enable_analytics = var.enable_analytics

  dynamic "cmek_settings" {
    for_each = var.cmek_settings

    content {
      name                 = cmek_settings.value.name
      kms_key_name         = cmek_settings.value.kms_key_name
      kms_key_version_name = cmek_settings.value.kms_key_version_name
      service_account_id   = cmek_settings.value.service_account_id
    }
  }

  dynamic "index_configs" {
    for_each = var.index_configs

    content {
      field_path = index_configs.value.field_path
      type       = index_configs.value.type
    }
  }
}