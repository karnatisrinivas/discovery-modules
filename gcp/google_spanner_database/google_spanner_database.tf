resource "google_spanner_database" "this" {
  database_dialect         = var.database_dialect
  ddl                      = var.ddl
  deletion_protection      = var.deletion_protection
  enable_drop_protection   = var.enable_drop_protection
  instance                 = var.instance
  name                     = var.name
  version_retention_period = var.version_retention_period

  dynamic "encryption_config" {
    for_each = var.encryption_config
    content {
      kms_key_name  = encryption_config.value.kms_key_name
      kms_key_names = encryption_config.value.kms_key_names
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
