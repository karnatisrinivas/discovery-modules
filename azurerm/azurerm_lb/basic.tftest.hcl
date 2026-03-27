variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"

  # Load balancer name (modify if needed)
  name = "my-lb-test"

  # Optional arguments (set to null or desired values)
  edge_zone = null
  sku       = null
  sku_tier  = null
  tags      = null

  # Frontend IP configuration (example with multiple entries)
  frontend_ip_configuration = [
    {
      name                 = "fe-1"
      public_ip_address_id = null # Optional, set ID if using
      private_ip_address   = null # Optional, set address if using
      subnet_id            = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg/providers/Microsoft.Network/virtualNetworks/example-vnet/subnets/default"
    },
    {
      name                 = "fe-2"
      public_ip_address_id = null        # Optional, set ID if using
      private_ip_address   = "10.0.1.10" # Optional, set address if using
      subnet_id            = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg/providers/Microsoft.Network/virtualNetworks/example-vnet/subnets/subnet2"
    }
  ]
}

run "create_loadbalancer" {
  command = apply

  assert {
    condition     = azurerm_lb.this.name == var.name
    error_message = "Loadbalancer name does not match expected value"
  }
}