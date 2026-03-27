data "azurerm_network_security_group" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
}