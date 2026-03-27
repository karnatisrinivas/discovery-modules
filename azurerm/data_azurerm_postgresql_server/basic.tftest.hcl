variables {

  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"

  name = "7537afb7b579-postgresql-server"
}

run "get_PGSQL_DB_server" {
  command = apply

  assert {
    condition     = data.azurerm_postgresql_server.this.name == var.name
    error_message = "PGSQL DB Server name does not match the expected value"
  }

}