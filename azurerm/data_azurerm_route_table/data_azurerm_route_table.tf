data "azurerm_route_table" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
}
