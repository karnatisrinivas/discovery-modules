resource "azurerm_mysql_flexible_server" "this" {
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name

  sku_name                          = var.sku_name
  administrator_login               = var.administrator_login
  administrator_password            = var.administrator_password
  backup_retention_days             = var.backup_retention_days
  create_mode                       = var.create_mode
  delegated_subnet_id               = var.delegated_subnet_id
  geo_redundant_backup_enabled      = var.geo_redundant_backup_enabled
  point_in_time_restore_time_in_utc = var.point_in_time_restore_time_in_utc
  private_dns_zone_id               = var.private_dns_zone_id
  source_server_id                  = var.source_server_id
  tags                              = var.tags
  zone                              = var.zone
}
