variables {
  subscription_id                       = "12345678-1234-9876-4563-123456789012"
  create_resource_group                 = false
  location                              = "eastus"
  tags                                  = {}
  type                                  = "ExpressRoute"
  bgp_route_translation_for_nat_enabled = false
  edge_zone                             = "test-zone"
  remote_vnet_traffic_enabled           = false
  virtual_wan_traffic_enabled           = false
  default_local_network_gateway_id      = "/subscriptions/TEST/resourceGroups/TEST/providers/Microsoft.Network/localNetworkGateways/TEST"
  name                                  = "test"
  vpn_type                              = "RouteBased"
  dns_forwarding_enabled                = false
  ip_sec_replay_protection_enabled      = false
  private_ip_address_enabled            = false
  resource_group_name                   = "sr-test-grp"
  sku                                   = "Basic"
  ip_configuration = [
    {
      name                          = "test"
      private_ip_address_allocation = "Static"
      public_ip_address_id          = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/my-rg/providers/Microsoft.Network/publicIPAddresses/my-public-ip"
      subnet_id                     = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/my-rg/providers/Microsoft.Network/virtualNetworks/my-vnet/subnets/GatewaySubnet"
    },
  ]
}
run "test" {
  command = plan
  assert {
    condition     = azurerm_virtual_network_gateway.this.name != null
    error_message = "azurerm_virtual_network_gateway was not succesful"
  }
}
