resource "azurerm_search_service" "this" {
  allowed_ips                              = var.allowed_ips
  authentication_failure_mode              = var.authentication_failure_mode
  customer_managed_key_enforcement_enabled = var.customer_managed_key_enforcement_enabled
  hosting_mode                             = var.hosting_mode
  local_authentication_enabled             = var.local_authentication_enabled
  location                                 = var.location
  name                                     = var.name
  partition_count                          = var.partition_count
  public_network_access_enabled            = var.public_network_access_enabled
  replica_count                            = var.replica_count
  resource_group_name                      = var.resource_group_name
  semantic_search_sku                      = var.semantic_search_sku
  sku                                      = var.sku
  tags                                     = var.tags

  dynamic "identity" {
    for_each = var.identity
    content {
      type = identity.value.type
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
