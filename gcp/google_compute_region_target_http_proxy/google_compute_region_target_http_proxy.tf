resource "google_compute_region_target_http_proxy" "this" {
  description                 = var.description
  http_keep_alive_timeout_sec = var.http_keep_alive_timeout_sec
  name                        = var.name
  url_map                     = var.url_map

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
