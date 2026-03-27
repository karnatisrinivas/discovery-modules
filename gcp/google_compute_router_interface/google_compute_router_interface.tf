resource "google_compute_router_interface" "this" {
  interconnect_attachment = var.interconnect_attachment
  ip_range                = var.ip_range
  ip_version              = var.ip_version
  name                    = var.name
  private_ip_address      = var.private_ip_address
  redundant_interface     = var.redundant_interface
  router                  = var.router
  subnetwork              = var.subnetwork
  vpn_tunnel              = var.vpn_tunnel

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

}
