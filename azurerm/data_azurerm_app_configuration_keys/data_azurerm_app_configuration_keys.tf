data "azurerm_app_configuration_keys" "this" {
  configuration_store_id = var.configuration_store_id
  key                    = var.key
  label                  = var.label

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      read = lookup(timeouts.value, "read", null)
    }
  }

}
