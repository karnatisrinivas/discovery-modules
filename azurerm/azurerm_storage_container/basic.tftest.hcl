variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "eastus"
  resource_group_name   = "example-rg"
  create_resource_group = false


  name = "container2"

  storage_account_name = "4fafae20storage"
}

run "validate" {
  command = apply

  assert {
    condition     = azurerm_storage_container.this.name != var.name
    error_message = "Azure storage container name is not correct"
  }
}
