data "azurerm_public_ip" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
}
