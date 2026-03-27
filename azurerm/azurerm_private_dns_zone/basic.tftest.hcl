variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"
  name                  = "privatelink.blob.core.windows.net"
  tags                  = null

}

run "create_private_dns_zone" {
  command = apply

  assert {
    condition     = azurerm_private_dns_zone.this.name == var.name
    error_message = "Loadbalancer name does not match expected value"
  }
}