variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"

  charset     = "UTF8"
  collation   = "English_United States.1252"
  name        = "example-postgresql-database"
  server_name = "7537afb7b579-postgresql-server"
}

run "create_postgresql_database" {
  command = apply

  assert {
    condition     = azurerm_postgresql_database.this.name == var.name
    error_message = "PostgreSQL Database name does not match the expected value"
  }
}