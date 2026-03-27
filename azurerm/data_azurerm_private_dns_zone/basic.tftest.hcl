variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  create_resource_group = false
  location              = "East US"
  name                  = "privatelink.blob.core.windows.net"
  tags                  = {}
  resource_group_name   = "example-rg-secondary"
}
run "test" {
  command = plan
  assert {
    condition     = data.azurerm_private_dns_zone.this.name != null
    error_message = "data.azurerm_private_dns_zone was not succesful"
  }
}
