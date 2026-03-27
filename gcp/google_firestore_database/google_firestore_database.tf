resource "google_firestore_database" "this" {
  app_engine_integration_mode       = var.app_engine_integration_mode
  concurrency_mode                  = var.concurrency_mode
  database_edition                  = var.database_edition
  delete_protection_state           = var.delete_protection_state
  deletion_policy                   = var.deletion_policy
  location_id                       = var.location_id
  name                              = var.name
  point_in_time_recovery_enablement = var.point_in_time_recovery_enablement
  tags                              = var.tags
  type                              = var.type

  dynamic "cmek_config" {
    for_each = var.cmek_config
    content {
      kms_key_name = cmek_config.value.kms_key_name
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
