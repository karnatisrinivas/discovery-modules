variables {
  location              = "westcentralus"
  create_resource_group = false
  resource_group_name   = "my-res-group"
  subscription_id       = "12345678-1234-9876-4563-123456789012"

  name       = "resgroup"
  managed_by = null
  tags       = {}
}

run "test" {
  command = plan
  assert {
    condition     = azurerm_resource_group.this.name == "resgroup"
    error_message = "azurerm_resource_group was not succesfull"
  }
}