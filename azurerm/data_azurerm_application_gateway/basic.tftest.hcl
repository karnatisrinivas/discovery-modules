variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"
  name                  = "example-appgateway"
}

run "get_application_gateway" {
  command = apply

  assert {
    condition     = data.azurerm_application_gateway.this.name == var.name
    error_message = "Application Gateway name does not match the expected value"
  }
}