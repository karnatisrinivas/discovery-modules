resource "azurerm_proximity_placement_group" "this" {
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name

  allowed_vm_sizes = var.allowed_vm_sizes
  tags             = var.tags
  zone             = var.zone
}
