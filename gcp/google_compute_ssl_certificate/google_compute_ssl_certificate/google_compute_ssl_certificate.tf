resource "google_compute_ssl_certificate" "this" {
  certificate = var.certificate
  description = var.description
  name        = var.name
  name_prefix = var.name_prefix
  private_key = var.private_key

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

}
