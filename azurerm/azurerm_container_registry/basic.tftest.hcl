variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  create_resource_group = "false"
  location              = "eastus"
  resource_group_name   = "test-vm"
  name                  = "testacrb95c4f2b"
  sku                   = "Premium"

  # Optional variables with default values
  admin_enabled                 = false
  anonymous_pull_enabled        = false
  data_endpoint_enabled         = false
  export_policy_enabled         = true
  network_rule_bypass_option    = "AzureServices"
  public_network_access_enabled = false
  quarantine_policy_enabled     = false
  zone_redundancy_enabled       = false

  # Tags are left as null, as they're optional and user-specific
  tags = null
}

run "create_azure_container_registry" {
  command = apply

  assert {
    condition     = azurerm_container_registry.this.name == var.name
    error_message = "Container registry name does not match expected value"
  }

  assert {
    condition     = azurerm_container_registry.this.location == var.location
    error_message = "Container registry location does not match expected value"
  }

  assert {
    condition     = azurerm_container_registry.this.resource_group_name == var.resource_group_name
    error_message = "Resource group name does not match expected value"
  }

  assert {
    condition     = azurerm_container_registry.this.sku == var.sku
    error_message = "Container registry SKU does not match expected value"
  }

  assert {
    condition     = azurerm_container_registry.this.admin_enabled == var.admin_enabled
    error_message = "Admin enabled setting does not match expected value"
  }

  assert {
    condition     = azurerm_container_registry.this.anonymous_pull_enabled == var.anonymous_pull_enabled
    error_message = "Anonymous pull enabled setting does not match expected value"
  }

  assert {
    condition     = azurerm_container_registry.this.data_endpoint_enabled == var.data_endpoint_enabled
    error_message = "Data endpoint enabled setting does not match expected value"
  }

  assert {
    condition     = azurerm_container_registry.this.export_policy_enabled == var.export_policy_enabled
    error_message = "Export policy enabled setting does not match expected value"
  }

  assert {
    condition     = azurerm_container_registry.this.network_rule_bypass_option == var.network_rule_bypass_option
    error_message = "Network rule bypass option does not match expected value"
  }

  assert {
    condition     = azurerm_container_registry.this.public_network_access_enabled == var.public_network_access_enabled
    error_message = "Public network access enabled setting does not match expected value"
  }

  assert {
    condition     = azurerm_container_registry.this.quarantine_policy_enabled == var.quarantine_policy_enabled
    error_message = "Quarantine policy enabled setting does not match expected value"
  }

  assert {
    condition     = azurerm_container_registry.this.zone_redundancy_enabled == var.zone_redundancy_enabled
    error_message = "Zone redundancy enabled setting does not match expected value"
  }

  assert {
    condition     = azurerm_container_registry.this.tags == var.tags
    error_message = "Tags do not match expected value"
  }
}