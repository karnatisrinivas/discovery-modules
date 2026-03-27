resource "azurerm_subnet_network_security_group_association" "this" {
  network_security_group_id = var.network_security_group_id
  subnet_id                 = var.subnet_id

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      read   = lookup(timeouts.value, "read", null)
    }
  }

}
