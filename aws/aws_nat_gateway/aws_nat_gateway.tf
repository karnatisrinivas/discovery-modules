resource "aws_nat_gateway" "this" {
  allocation_id                      = var.allocation_id
  connectivity_type                  = var.connectivity_type
  private_ip                         = var.private_ip == "" ? null : var.private_ip
  secondary_allocation_ids           = var.secondary_allocation_ids
  secondary_private_ip_address_count = var.secondary_private_ip_address_count == 0 ? null : var.secondary_private_ip_address_count
  secondary_private_ip_addresses     = length(var.secondary_private_ip_addresses) == 0 ? null : var.secondary_private_ip_addresses
  subnet_id                          = var.subnet_id
  tags                               = var.tags

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
