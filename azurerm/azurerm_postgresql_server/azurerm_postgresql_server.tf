resource "azurerm_postgresql_server" "this" {
  location                = var.location
  name                    = var.name
  resource_group_name     = var.resource_group_name
  sku_name                = var.sku_name
  ssl_enforcement_enabled = var.ssl_enforcement_enabled
  version                 = var.postgresql_version

  administrator_login               = var.administrator_login
  administrator_login_password      = var.administrator_login_password
  auto_grow_enabled                 = var.auto_grow_enabled
  create_mode                       = var.create_mode
  creation_source_server_id         = var.creation_source_server_id
  geo_redundant_backup_enabled      = var.geo_redundant_backup_enabled
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
  public_network_access_enabled     = var.public_network_access_enabled
  restore_point_in_time             = var.restore_point_in_time
  ssl_minimal_tls_version_enforced  = var.ssl_minimal_tls_version_enforced
  tags                              = var.tags
}
