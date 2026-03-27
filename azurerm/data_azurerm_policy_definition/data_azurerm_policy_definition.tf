data "azurerm_policy_definition" "this" {
  display_name          = var.name == "" ? var.display_name : null
  management_group_name = var.management_group_name
  name                  = var.name

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      read = lookup(timeouts.value, "read", null)
    }
  }

}
