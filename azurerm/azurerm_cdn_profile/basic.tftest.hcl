variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"
  name                  = "example-cdnprofile"

  sku = "Standard_Akamai"

  tags = {}
}

run "basic" {
  command = plan
  assert {
    condition     = azurerm_cdn_profile.this.name == "example-cdnprofile"
    error_message = "failed to execute terraform plan with basic settings"
  }
}
