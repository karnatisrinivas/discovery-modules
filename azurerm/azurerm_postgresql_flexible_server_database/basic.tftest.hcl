#tftest.hcl
variables {


  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"

  name      = "db1"
  server_id = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg/providers/Microsoft.DBforPostgreSQL/flexibleServers/example-psql-flexible-server"
  charset   = "utf8"
  collation = "en_US.utf8"
}

run "basic" {
  command = plan
  assert {
    condition     = azurerm_postgresql_flexible_server_database.this.name == var.name
    error_message = "failed to execute terraform plan for azure postgresql server database"
  }
}