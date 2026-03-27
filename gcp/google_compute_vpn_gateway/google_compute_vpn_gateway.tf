resource "google_compute_vpn_gateway" "this" {
  description = var.description
  name        = var.name
  network     = var.network

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

}
