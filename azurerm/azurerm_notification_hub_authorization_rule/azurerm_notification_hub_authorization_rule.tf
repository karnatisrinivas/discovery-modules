resource "azurerm_notification_hub_authorization_rule" "this" {
  name                  = var.name
  notification_hub_name = var.notification_hub_name
  namespace_name        = var.namespace_name
  manage                = var.manage
  send                  = var.send
  listen                = var.listen
  resource_group_name   = var.resource_group_name

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
