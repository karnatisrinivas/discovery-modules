variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"
}

run "get_client_config" {
  command = plan
  assert {
    condition     = data.azurerm_client_config.this.subscription_id == var.subscription_id
    error_message = "current client config is not found."
  }
}
