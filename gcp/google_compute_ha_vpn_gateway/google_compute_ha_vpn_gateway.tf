resource "google_compute_ha_vpn_gateway" "this" {
  description        = var.description
  gateway_ip_version = var.gateway_ip_version
  labels             = var.labels
  name               = var.name
  network            = var.network
  stack_type         = var.stack_type

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

  dynamic "vpn_interfaces" {
    for_each = var.vpn_interfaces
    content {
      id                      = vpn_interfaces.value.id
      interconnect_attachment = vpn_interfaces.value.interconnect_attachment
    }
  }

}
