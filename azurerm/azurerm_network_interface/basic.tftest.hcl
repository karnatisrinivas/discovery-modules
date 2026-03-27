variables {
  subscription_id               = "12345678-1234-9876-4563-123456789012"
  location                      = "East US"
  resource_group_name           = "test-vm"
  create_resource_group         = "false"
  name                          = "test-nic"
  private_ip_address_version    = "IPv4"
  private_ip_address_allocation = "Dynamic"
  subnet_id                     = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-network-rg/providers/Microsoft.Network/virtualNetworks/example-network-rg/subnets/snet-eastus-1"
  auxiliary_mode                = "None"
  tags                          = {}
  ip_configuration = [
    {
      name                                               = "test-nic"
      private_ip_address_version                         = "IPv4"
      private_ip_address_allocation                      = "Dynamic"
      subnet_id                                          = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-network-rg/providers/Microsoft.Network/virtualNetworks/example-network-rg/subnets/snet-eastus-1"
      gateway_load_balancer_frontend_ip_configuration_id = null
      public_ip_address_id                               = null
      primary                                            = true
      private_ip_address                                 = null
    }
  ]
}

run "validate_network_interface" {
  command = plan

  assert {
    condition     = azurerm_network_interface.this.name == "test-nic"
    error_message = "Network Interface name does not match the expected name 'test-nic'."
  }
}
