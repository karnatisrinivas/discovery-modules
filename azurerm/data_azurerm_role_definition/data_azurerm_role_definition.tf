data "azurerm_role_definition" "this" {
  name               = var.name
  role_definition_id = var.role_definition_id
  scope              = var.scope

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      read = lookup(timeouts.value, "read", null)
    }
  }

}
