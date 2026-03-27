data "azurerm_storage_account" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name

  min_tls_version = var.min_tls_version
}
