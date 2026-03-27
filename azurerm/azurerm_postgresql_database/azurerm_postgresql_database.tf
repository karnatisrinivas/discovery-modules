resource "azurerm_postgresql_database" "this" {
  charset             = var.charset
  collation           = var.collation
  name                = var.name
  resource_group_name = var.resource_group_name
  server_name         = var.server_name
}
