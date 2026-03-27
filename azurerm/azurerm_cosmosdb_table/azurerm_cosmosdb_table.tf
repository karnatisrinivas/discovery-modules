resource "azurerm_cosmosdb_table" "this" {
  account_name        = var.account_name
  name                = var.name
  resource_group_name = var.resource_group_name
}
