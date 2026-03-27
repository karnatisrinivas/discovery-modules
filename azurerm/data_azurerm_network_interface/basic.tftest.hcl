variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "test-vm"
  create_resource_group = "false"
  name                  = "test-nic" # Default, empty tags
}

run "validate_network_interface" {
  command = apply

  assert {
    condition     = data.azurerm_network_interface.this.id != null
    error_message = "Network Interface name does not match the expected name 'test-nic'."
  }
}
