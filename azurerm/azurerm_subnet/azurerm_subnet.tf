resource "azurerm_subnet" "this" {
  address_prefixes     = var.address_prefixes
  name                 = var.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name

  default_outbound_access_enabled = var.default_outbound_access_enabled
  service_endpoint_policy_ids     = var.service_endpoint_policy_ids
  service_endpoints               = var.service_endpoints
}
