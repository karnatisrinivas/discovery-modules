resource "azurerm_resource_group" "this" {
  location = var.location
  name     = var.name

  managed_by = var.managed_by
  tags       = var.tags
}