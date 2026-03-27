variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  create_resource_group = false
  location              = "eastus"
  name                  = "storagetest"
  storage_account_name  = "teststorageaccount"
  resource_group_name   = "test-resource-group"
}
run "test" {
  command = plan
  assert {
    condition     = azurerm_storage_table.this.name != null
    error_message = "azurerm_storage_table was not succesful"
  }
}
