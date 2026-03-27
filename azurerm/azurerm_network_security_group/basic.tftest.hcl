variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  create_resource_group = "false"
  location              = "East US"
  resource_group_name   = "example-rg"
  name                  = "default"
  security_rules = [
    {
      name                       = "test123"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
  tags = { env : "prod" }
}


run "validate" {
  command = apply
  assert {
    condition     = azurerm_network_security_group.this.name == "default"
    error_message = "Network Security Group not found"
  }
}
