variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "test-vm"
  create_resource_group = "false"
  name                  = "test-vm" # Default, empty tags
}

run "validate_network_interface" {
  command = apply

  assert {
    condition     = data.azurerm_virtual_machine.this.id != null
    error_message = "Virtual Machine id should not be null"
  }
}
