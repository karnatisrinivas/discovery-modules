resource "azurerm_virtual_network" "this" {
  address_space           = var.address_space
  location                = var.location
  name                    = var.name
  resource_group_name     = var.resource_group_name
  edge_zone               = var.edge_zone != "" ? var.edge_zone : null
  flow_timeout_in_minutes = var.flow_timeout_in_minutes == 0 ? null : var.flow_timeout_in_minutes
  tags                    = var.tags
}
