variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  create_resource_group = false
  location              = "East US"
  records               = ["1.1.1.1", "2.2.2.2"]
  resource_group_name   = "example-rg-secondary"
  tags                  = {}
  ttl                   = 60
  zone_name             = "privatelink.blob.core.windows.net"
  name                  = "test-a-record"
}
run "test" {
  command = plan
  assert {
    condition     = azurerm_private_dns_a_record.this.name != null
    error_message = "azurerm_private_dns_a_record was not succesful"
  }
}
