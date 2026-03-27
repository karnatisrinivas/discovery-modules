#tftest.hcl
variables {

  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"

  name      = "azure.extensions"
  server_id = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg/providers/Microsoft.DBforPostgreSQL/flexibleServers/example-psql-flexible-server"
  value     = "CUBE,CITEXT,BTREE_GIST"
}

run "basic" {
  command = plan
  assert {
    condition     = azurerm_postgresql_flexible_server_configuration.this.name == var.name
    error_message = "failed to execute terraform plan for azure postgresql server configuration"
  }
}