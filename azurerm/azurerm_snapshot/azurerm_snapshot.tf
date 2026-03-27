resource "azurerm_snapshot" "this" {
  create_option                 = var.create_option
  disk_access_id                = var.disk_access_id
  disk_size_gb                  = var.disk_size_gb
  incremental_enabled           = var.incremental_enabled
  location                      = var.location
  name                          = var.name
  network_access_policy         = var.network_access_policy
  public_network_access_enabled = var.public_network_access_enabled
  resource_group_name           = var.resource_group_name
  source_resource_id            = var.source_resource_id
  source_uri                    = var.source_uri
  storage_account_id            = var.storage_account_id
  tags                          = var.tags

  dynamic "encryption_settings" {
    for_each = var.encryption_settings
    content {
      enabled = encryption_settings.value.enabled

      dynamic "disk_encryption_key" {
        for_each = encryption_settings.value.disk_encryption_key
        content {
          secret_url      = disk_encryption_key.value.secret_url
          source_vault_id = disk_encryption_key.value.source_vault_id
        }
      }

      dynamic "key_encryption_key" {
        for_each = encryption_settings.value.key_encryption_key
        content {
          key_url         = key_encryption_key.value.key_url
          source_vault_id = key_encryption_key.value.source_vault_id
        }
      }

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
