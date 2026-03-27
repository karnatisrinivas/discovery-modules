resource "google_compute_http_health_check" "this" {
  check_interval_sec  = var.check_interval_sec
  description         = var.description
  healthy_threshold   = var.healthy_threshold
  host                = var.host
  name                = var.name
  port                = var.port
  request_path        = var.request_path
  timeout_sec         = var.timeout_sec
  unhealthy_threshold = var.unhealthy_threshold

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
