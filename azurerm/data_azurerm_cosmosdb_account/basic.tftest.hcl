variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"
  name                  = "example-cosmosdb-7537afb7b579"
}

run "get_cosmosdb_account" {
  command = apply

  assert {
    condition     = data.azurerm_cosmosdb_account.this.name == var.name
    error_message = "Databricks workspace name does not match the expected value"
  }
}