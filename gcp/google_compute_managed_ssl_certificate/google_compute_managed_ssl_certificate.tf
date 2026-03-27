resource "google_compute_managed_ssl_certificate" "this" {
  description = var.description
  name        = var.name
  type        = var.type

  dynamic "managed" {
    for_each = var.managed
    content {
      domains = managed.value.domains
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

}
