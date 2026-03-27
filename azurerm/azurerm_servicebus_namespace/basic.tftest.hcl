variables {
  location                = "eastus"
  name                    = "gahagatest"
  tags                    = { "hehe" : "haha" }
  resource_group_name     = "gahagatest"
  servicebus_namespace_id = null
}

run "validate_azurerm_servicebus_namespace_created_with_proper_name" {
  command = plan
  assert {
    condition     = azurerm_servicebus_namespace.this.name == var.name
    error_message = "Expected azurerm_servicebus_namespace resource to be created with proper name"
  }
  assert {
    condition     = length(azurerm_servicebus_namespace.this.identity) == 0
    error_message = "Expected default identity to be applied"
  }
}

run "validate_azurerm_servicebus_namespace_created_with_identity" {
  command = plan
  variables {
    identity_type = "UserAssigned"
    identity_ids  = ["/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-resource-group/providers/Microsoft.ManagedIdentity/userAssignedIdentities/userAssignedIdentityValue"]
  }
  assert {
    condition     = length(azurerm_servicebus_namespace.this.identity) == 1
    error_message = "Expected azurerm_servicebus_namespace resource to be created with proper name"
  }
}
