variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  create_resource_group = "false"
  location              = "West US 2"
  resource_group_name   = "example-rg-secondary"
  name                  = "default"
  virtual_network_name  = "vnet-test-1"
}


run "validate" {
  command = apply
  assert {
    condition     = data.azurerm_subnet.this.id != null
    error_message = "Subnet not found"
  }
}
