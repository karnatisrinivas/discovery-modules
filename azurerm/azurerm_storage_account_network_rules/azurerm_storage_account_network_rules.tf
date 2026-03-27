resource "azurerm_storage_account_network_rules" "this" {
  bypass                     = var.bypass
  default_action             = var.default_action
  ip_rules                   = var.ip_rules
  storage_account_id         = var.storage_account_id
  virtual_network_subnet_ids = var.virtual_network_subnet_ids

  dynamic "private_link_access" {
    for_each = var.private_link_access
    content {
      endpoint_resource_id = private_link_access.value.endpoint_resource_id
      endpoint_tenant_id   = private_link_access.value.endpoint_tenant_id
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
