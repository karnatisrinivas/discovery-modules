data "azurerm_key_vault_secret" "this" {
  key_vault_id = var.key_vault_id
  name         = var.name
}
