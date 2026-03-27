resource "google_workflows_workflow" "this" {
  call_log_level          = var.call_log_level
  crypto_key_name         = var.crypto_key_name
  deletion_protection     = var.deletion_protection
  description             = var.description
  execution_history_level = var.execution_history_level
  labels                  = var.labels
  name                    = var.name
  name_prefix             = var.name_prefix
  service_account         = var.service_account
  source_contents         = var.source_contents
  tags                    = var.tags
  user_env_vars           = var.user_env_vars

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
