data "azurerm_mysql_flexible_server" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
}
