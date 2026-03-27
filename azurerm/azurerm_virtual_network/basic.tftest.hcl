variables {
  subscription_id         = "12345678-1234-9876-4563-123456789012"
  location                = "East US"
  resource_group_name     = "example-rg"
  create_resource_group   = "false"
  address_space           = ["10.0.0.0/16"]
  edge_zone               = null
  flow_timeout_in_minutes = null
  name                    = "example-vnet"
  tags = {
    environment = "test"
  }
}

run "create_azure_virtual_network" {
  command = apply

  assert {
    condition     = azurerm_virtual_network.this.name == var.name
    error_message = "Virtual Network name does not match expected value"
  }

}
