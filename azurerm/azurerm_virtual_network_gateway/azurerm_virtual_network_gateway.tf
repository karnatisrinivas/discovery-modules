resource "azurerm_virtual_network_gateway" "this" {
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  type                = var.type

  bgp_route_translation_for_nat_enabled = var.bgp_route_translation_for_nat_enabled
  default_local_network_gateway_id      = var.default_local_network_gateway_id
  dns_forwarding_enabled                = var.dns_forwarding_enabled
  edge_zone                             = var.edge_zone
  ip_sec_replay_protection_enabled      = var.ip_sec_replay_protection_enabled
  private_ip_address_enabled            = var.private_ip_address_enabled
  remote_vnet_traffic_enabled           = var.remote_vnet_traffic_enabled
  tags                                  = var.tags
  virtual_wan_traffic_enabled           = var.virtual_wan_traffic_enabled
  vpn_type                              = var.vpn_type

  dynamic "ip_configuration" {
    for_each = var.ip_configuration
    content {
      name                          = ip_configuration.value.name
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
      public_ip_address_id          = ip_configuration.value.public_ip_address_id
      subnet_id                     = ip_configuration.value.subnet_id
    }
  }
}
