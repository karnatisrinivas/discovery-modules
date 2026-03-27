variables {
  subscription_id                 = "12345678-1234-9876-4563-123456789012"
  create_resource_group           = "false"
  location                        = "East US"
  resource_group_name             = "example-rg"
  name                            = "default"
  address_prefixes                = ["10.0.0.0/24"]
  virtual_network_name            = "example-vnet"
  default_outbound_access_enabled = null
  service_endpoint_policy_ids     = null
  service_endpoints               = null
}


run "validate" {
  command = apply
  assert {
    condition     = azurerm_subnet.this.id != null
    error_message = "Subnet not found"
  }
}
