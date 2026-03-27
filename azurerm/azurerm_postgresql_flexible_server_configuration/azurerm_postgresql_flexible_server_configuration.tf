resource "azurerm_postgresql_flexible_server_configuration" "this" {
  name      = var.name
  server_id = var.server_id
  value     = var.value
}
