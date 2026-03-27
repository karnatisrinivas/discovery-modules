resource "azurerm_app_configuration_key" "this" {
  configuration_store_id = var.configuration_store_id
  content_type           = var.content_type
  etag                   = var.etag
  key                    = var.key
  label                  = var.label
  locked                 = var.locked
  tags                   = var.tags
  type                   = var.type
  value                  = var.value == "" ? null : var.value
  vault_key_reference    = var.vault_key_reference == "" ? null : var.vault_key_reference

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      read   = lookup(timeouts.value, "read", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
