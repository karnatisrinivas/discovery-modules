resource "azurerm_route" "this" {
  address_prefix         = var.address_prefix
  name                   = var.name
  next_hop_in_ip_address = var.next_hop_in_ip_address
  next_hop_type          = var.next_hop_type
  resource_group_name    = var.resource_group_name
  route_table_name       = var.route_table_name

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
