variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  create_resource_group = false
  location              = "eastus"
  account_name          = "storagetest"
  name                  = "testtable"
  resource_group_name   = "test-grp"
}
run "test" {
  command = plan
  assert {
    condition     = azurerm_cosmosdb_table.this.name != null
    error_message = "azurerm_cosmosdb_table was not succesful"
  }
}
