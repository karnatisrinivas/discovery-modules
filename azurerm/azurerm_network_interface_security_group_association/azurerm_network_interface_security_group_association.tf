resource "azurerm_network_interface_security_group_association" "this" {
  network_interface_id      = var.network_interface_id
  network_security_group_id = var.network_security_group_id

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      read   = lookup(timeouts.value, "read", null)
    }
  }

}
