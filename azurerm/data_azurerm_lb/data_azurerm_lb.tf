data "azurerm_lb" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
}
