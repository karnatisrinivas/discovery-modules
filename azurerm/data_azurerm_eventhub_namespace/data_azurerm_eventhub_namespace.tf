data "azurerm_eventhub_namespace" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
}
