variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"

  # Backend address pool address specific values
  backend_address_pool_id = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg/providers/Microsoft.Network/loadBalancers/my-lb-test/backendAddressPools/my-backend-pool-test"
  name                    = "my-backend-address-test"

  # Choose one option (not both):
  # Option 1: Using IP address
  ip_address                          = "10.0.2.10"
  backend_address_ip_configuration_id = null # Set to null if using IP address

  # Option 2: Using IP configuration ID (requires backend_ip_configuration defined in load balancer)
  # ip_address = null
  # backend_address_ip_configuration_id = "your-backend-ip-config-id"  # Replace with actual ID

  # Optional argument (set to null if not used)
  virtual_network_id = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg/providers/Microsoft.Network/virtualNetworks/example-vnet"
}

run "create_lb_backend_address_pool" {
  command = apply

  assert {
    condition     = azurerm_lb_backend_address_pool_address.this.name == var.name
    error_message = "Loadbalancer backend address pool address name does not match expected value"
  }
}