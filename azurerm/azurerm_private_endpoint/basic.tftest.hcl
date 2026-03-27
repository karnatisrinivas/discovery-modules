variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"
  # Required values (replace with actual values)
  name      = "example-private-endpoint"
  subnet_id = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg/providers/Microsoft.Network/virtualNetworks/example-vnet/subnets/default"

  # Optional values with defaults
  private_dns_zone_group = []

  private_service_connection = [
    {
      name                              = "example-private-service-connection"
      private_connection_resource_id    = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg/providers/Microsoft.Storage/storageAccounts/exmplstorage01"
      subresource_names                 = ["blob"]
      is_manual_connection              = false
      private_connection_resource_alias = null
    }
  ]

  custom_network_interface_name = null

  tags = {
    Environment = "Test"
    Project     = "Example"
  }
}

run "create_private_endpoint" {
  command = apply

  assert {
    condition     = azurerm_private_endpoint.this.name == var.name
    error_message = "Private Endpoint name does not match expected value"
  }
}