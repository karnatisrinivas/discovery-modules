variables {
  subscription_id                   = "12345678-1234-9876-4563-123456789012"
  location                          = "East US"
  resource_group_name               = "example-rg"
  create_resource_group             = "false"
  name                              = "mysql-server-485c" # Server name required
  sku_name                          = "B_Standard_B1s"
  administrator_login               = "default_admin_login"    # Admin login required
  administrator_password            = "techstrongpswd" # Admin password is required, set securely
  backup_retention_days             = 7                        # Default backup retention, can be changed
  create_mode                       = "Default"                # Default create mode, leave empty if not needed
  delegated_subnet_id               = null                     # Needs actual subnet ID, leave empty for input
  geo_redundant_backup_enabled      = false                    # Default set to false
  point_in_time_restore_time_in_utc = null                     # Leave empty for input if needed
  private_dns_zone_id               = null                     # DNS zone ID can be set if needed
  source_server_id                  = null                     # Leave empty if not using a source server
  tags                              = {}                       # Default tags
  zone                              = null                     # Set zone if needed
}

run "basic" {
  command = plan
  assert {
    condition     = azurerm_mysql_flexible_server.this.name == var.name
    error_message = "failed to execute terraform plan with RBAC enabled for mongodb"
  }
}