variables {
  subscription_id         = "12345678-1234-9876-4563-123456789012"
  location                = "East US"
  resource_group_name     = "example-rg"
  create_resource_group   = "false"
  name                    = "example-postgresql-server"
  sku_name                = "B_Gen5_1"
  ssl_enforcement_enabled = true
  postgresql_version      = "11"

  administrator_login               = "admin34"
  administrator_login_password      = "techstrongpswd!"
  auto_grow_enabled                 = true
  create_mode                       = null
  creation_source_server_id         = null
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  restore_point_in_time             = null
  ssl_minimal_tls_version_enforced  = "TLS1_2"
  tags = {
    environment = "test"
  }
}

run "create_postgresql_server" {
  command = plan

  assert {
    condition     = azurerm_postgresql_server.this.name == var.name
    error_message = "PostgreSQL Server name does not match the expected value"
  }
}