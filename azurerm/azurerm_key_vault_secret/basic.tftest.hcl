variables {
  key_name            = "gahagatesting"
  key_vault_name      = "key-vault-gahagatest"
  resource_group_name = "gahaga-test"
  secret_name         = "gahagatest"
  secret_value        = "g4h4g4t3st\n\n\n\n~~~~~~~~!!!!@@@@####$$$$%%%%^^^^&&&&&"
}

run "validate" {
  command = plan
  assert {
    condition     = azurerm_key_vault_secret.this.name == "gahagatest"
    error_message = ""
  }
  assert {
    condition     = azurerm_key_vault_secret.this.content_type == null
    error_message = ""
  }
}
