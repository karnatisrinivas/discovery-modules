resource "google_compute_region_target_tcp_proxy" "this" {
  backend_service = var.backend_service
  description     = var.description
  name            = var.name
  proxy_bind      = var.proxy_bind
  proxy_header    = var.proxy_header

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

}
