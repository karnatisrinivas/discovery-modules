data "azurerm_virtual_machine" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
}
