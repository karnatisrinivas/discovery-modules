variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"
  private_dns_zone_name = "privatelink.blob.core.windows.net"
  name                  = "vent-blob-link"
  tags                  = null
  virtual_network_id    = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg/providers/Microsoft.Network/virtualNetworks/example-vnet"
  registration_enabled  = true

}

run "create_private_dns_zone_virtual_network_link" {
  command = plan

  assert {
    condition     = azurerm_private_dns_zone_virtual_network_link.this.name == var.name
    error_message = "Private DNS Zone virtual Network Link name does not match expected value"
  }
}