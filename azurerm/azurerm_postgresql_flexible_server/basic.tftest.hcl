#tftest.hcl
variables {
  # Required values - must be provided by user

  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"


  name                   = "example-psql-flexible-server"         # Required: Name of the PostgreSQL server
  administrator_password = "techstrongpswd" # Required: Password for the administrator
  administrator_login    = "exampleadmin"             # Required: Login for the administrator

  # Optional values with defaults
  auto_grow_enabled                 = true
  create_mode                       = "Default"
  sku_name                          = "B_Standard_B1ms"
  postgresql_version                = "11"
  delegated_subnet_id               = null # Required only for private access
  geo_redundant_backup_enabled      = false
  point_in_time_restore_time_in_utc = null # Required only for Point In Time Restore
  private_dns_zone_id               = null # Required only for private access
  public_network_access_enabled     = true
  replication_role                  = null # Required only for replication
  source_server_id                  = null # Required only for replicas or PITR
  tags = {
    environment = "production"
    managed_by  = "terraform"
  }
  zone = "1" # Availability zone number (1, 2, or 3)
}

run "basic" {
  command = plan
  assert {
    condition     = azurerm_postgresql_flexible_server.this.name == var.name
    error_message = "failed to execute terraform plan for azure postgresql flexible server"
  }
}