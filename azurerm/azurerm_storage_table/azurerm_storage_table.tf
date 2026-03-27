resource "azurerm_storage_table" "this" {
  name                 = var.name
  storage_account_name = var.storage_account_name
}
