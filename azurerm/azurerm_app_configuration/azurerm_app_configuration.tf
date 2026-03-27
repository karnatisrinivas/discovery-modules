resource "azurerm_app_configuration" "this" {
  local_auth_enabled         = var.local_auth_enabled
  location                   = var.location
  name                       = var.name
  public_network_access      = var.public_network_access
  purge_protection_enabled   = var.purge_protection_enabled
  resource_group_name        = var.resource_group_name
  sku                        = var.sku
  soft_delete_retention_days = var.soft_delete_retention_days
  tags                       = var.tags

  dynamic "encryption" {
    for_each = var.encryption
    content {
      identity_client_id       = encryption.value.identity_client_id
      key_vault_key_identifier = encryption.value.key_vault_key_identifier
    }
  }

  dynamic "identity" {
    for_each = var.identity
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "replica" {
    for_each = var.replica
    content {
      location = replica.value.location
      name     = replica.value.name
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      read   = lookup(timeouts.value, "read", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
