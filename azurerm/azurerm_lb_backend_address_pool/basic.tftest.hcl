variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"

  loadbalancer_id = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg/providers/Microsoft.Network/loadBalancers/my-lb-test"
  name            = "my-backend-pool-test"

  # Optional arguments (set to null or desired values)
  synchronous_mode   = null # Defaults to true
  virtual_network_id = null # Required if not using internal address
}

run "create_lb_backend_address_pool" {
  command = apply

  assert {
    condition     = azurerm_lb_backend_address_pool.this.name == var.name
    error_message = "Loadbalancer name does not match expected value"
  }
}