resource "azurerm_policy_definition" "this" {
  description         = var.description
  display_name        = var.display_name
  management_group_id = var.management_group_id
  metadata            = var.metadata
  mode                = var.mode
  name                = var.name
  parameters          = var.parameters
  policy_rule         = var.policy_rule
  policy_type         = var.policy_type

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
