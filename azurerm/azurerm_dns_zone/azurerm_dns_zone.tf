resource "azurerm_dns_zone" "zone" {
  name                = var.domain
  resource_group_name = var.resource_group_name
}

