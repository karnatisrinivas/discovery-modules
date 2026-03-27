variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  create_resource_group = "false"
  location              = "eastus"
  resource_group_name   = "test-vm"
  name                  = "testacrb95c4f2b"
}

run "create_azure_container_registry" {
  command = apply

  assert {
    condition     = data.azurerm_container_registry.this.name == var.name
    error_message = "Container registry name does not match expected value"
  }

  assert {
    condition     = data.azurerm_container_registry.this.location == var.location
    error_message = "Container registry location does not match expected value"
  }

  assert {
    condition     = data.azurerm_container_registry.this.resource_group_name == var.resource_group_name
    error_message = "Resource group name does not match expected value"
  }
}