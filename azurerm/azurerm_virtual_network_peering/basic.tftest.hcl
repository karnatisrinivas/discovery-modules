variables {
  name                                   = "test"
  subscription_id                        = "12345678-1234-9876-4563-123456789012"
  resource_group_name                    = "example-azure-rg"
  location                               = "us-west-2"
  create_resource_group                  = false
  virtual_network_name                   = "example-azure-vnet"
  remote_virtual_network_id              = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-azure-rg/providers/Microsoft.Network/virtualNetworks/example-azure-vnet"
  allow_virtual_network_access           = true
  allow_forwarded_traffic                = true
  allow_gateway_transit                  = true
  only_ipv6_peering_enabled              = true
  peer_complete_virtual_networks_enabled = true
  remote_subnet_names                    = []
  local_subnet_names                     = []
  use_remote_gateways                    = true
  triggers = {
    test = "test"
  }
  timeouts = {
    create = "10m"
    delete = "10m"
    read   = "10m"
    update = "10m"
  }
}

run "test" {
  command = plan
  assert {
    condition     = azurerm_virtual_network_peering.this.name == "test"
    error_message = "The name of the virtual network peering should be test"
  }
}

