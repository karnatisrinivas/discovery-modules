resource "azurerm_mssql_elasticpool" "this" {
  enclave_type                   = var.enclave_type
  license_type                   = var.license_type
  location                       = var.location
  maintenance_configuration_name = var.maintenance_configuration_name
  max_size_bytes                 = var.max_size_bytes
  max_size_gb                    = var.max_size_gb
  name                           = var.name
  resource_group_name            = var.resource_group_name
  server_name                    = var.server_name
  tags                           = var.tags
  zone_redundant                 = var.zone_redundant

  dynamic "per_database_settings" {
    for_each = var.per_database_settings
    content {
      max_capacity = per_database_settings.value.max_capacity
      min_capacity = per_database_settings.value.min_capacity
    }
  }

  dynamic "sku" {
    for_each = var.sku
    content {
      capacity = sku.value.capacity
      family   = sku.value.family
      name     = sku.value.name
      tier     = sku.value.tier
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
