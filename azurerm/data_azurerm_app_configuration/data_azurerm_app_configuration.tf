data "azurerm_app_configuration" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      read = lookup(timeouts.value, "read", null)
    }
  }

}
