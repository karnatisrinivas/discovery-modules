data "azurerm_eventhub_authorization_rule" "this" {
  eventhub_name       = var.eventhub_name
  name                = var.name
  namespace_name      = var.namespace_name
  resource_group_name = var.resource_group_name

  listen = var.listen
  manage = var.manage
  send   = var.send
}
