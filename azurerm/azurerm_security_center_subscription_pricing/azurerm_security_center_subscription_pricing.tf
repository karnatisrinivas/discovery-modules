resource "azurerm_security_center_subscription_pricing" "this" {
  resource_type = var.resource_type
  subplan       = var.subplan
  tier          = var.tier

  dynamic "extension" {
    for_each = var.extension
    content {
      additional_extension_properties = extension.value.additional_extension_properties
      name                            = extension.value.name
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
