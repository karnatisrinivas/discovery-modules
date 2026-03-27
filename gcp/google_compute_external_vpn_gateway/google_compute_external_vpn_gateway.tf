resource "google_compute_external_vpn_gateway" "this" {
  description     = var.description
  labels          = var.labels
  name            = var.name
  redundancy_type = var.redundancy_type

  dynamic "interface" {
    for_each = var.interface
    content {
      id           = interface.value.id
      ip_address   = interface.value.ip_address
      ipv6_address = interface.value.ipv6_address
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
