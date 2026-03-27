variables {
  key_name             = "gahagatesting"
  key_vault_name       = "key-vault-gahagatest"
  resource_group_name  = "gahaga-test"
  expiration_date      = null
  expire_after         = null
  key_vault_id         = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/appcd-test/providers/Microsoft.KeyVault/vaults/test"
  not_before_date      = null
  notify_before_expiry = null
  time_after_creation  = null
  time_before_expiry   = null

}

run "validate" {
  command = plan
  assert {
    condition     = azurerm_key_vault_key.this.name == "gahagatesting"
    error_message = ""
  }
  assert {
    condition     = azurerm_key_vault_key.this.key_type == "RSA"
    error_message = ""
  }
  assert {
    condition     = azurerm_key_vault_key.this.key_size == 2048
    error_message = ""
  }
}
run "validate_EC_key" {
  command = plan
  variables {
    key_type = "EC"
  }
  assert {
    condition     = azurerm_key_vault_key.this.key_type == "EC"
    error_message = ""
  }
  assert {
    condition     = azurerm_key_vault_key.this.curve == "P-256"
    error_message = ""
  }
  assert {
    condition     = length(azurerm_key_vault_key.this.rotation_policy) == 0
    error_message = ""
  }
}

run "validate_automatic_block" {
  command = plan
  variables {
    time_after_creation  = "P30D"
    notify_before_expiry = "P29D"
    expire_after         = "P60D"
  }
  assert {
    condition     = length(azurerm_key_vault_key.this.rotation_policy) > 0
    error_message = ""
  }
  assert {
    condition     = length(azurerm_key_vault_key.this.rotation_policy[0].automatic) > 0
    error_message = ""
  }
  assert {
    condition     = azurerm_key_vault_key.this.rotation_policy[0].automatic[0].time_after_creation == "P30D"
    error_message = ""
  }
}

run "validate_automatic_block_two_settigns" {
  command = plan
  variables {
    time_after_creation  = "P30D"
    time_before_expiry   = "P1D"
    notify_before_expiry = "P29D"
    expire_after         = "P60D"
  }
  assert {
    condition     = length(azurerm_key_vault_key.this.rotation_policy) > 0
    error_message = ""
  }
  assert {
    condition     = length(azurerm_key_vault_key.this.rotation_policy[0].automatic) > 0
    error_message = ""
  }
  assert {
    condition     = azurerm_key_vault_key.this.rotation_policy[0].automatic[0].time_after_creation == "P30D"
    error_message = ""
  }
  assert {
    condition     = azurerm_key_vault_key.this.rotation_policy[0].automatic[0].time_before_expiry == "P1D"
    error_message = ""
  }
}
