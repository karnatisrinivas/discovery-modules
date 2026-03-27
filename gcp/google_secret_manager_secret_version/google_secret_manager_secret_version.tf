resource "google_secret_manager_secret_version" "this" {
  deletion_policy        = var.deletion_policy
  enabled                = var.enabled
  is_secret_data_base64  = var.is_secret_data_base64
  secret                 = var.secret
  secret_data            = var.secret_data
  secret_data_wo         = var.secret_data_wo
  secret_data_wo_version = var.secret_data_wo_version

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
