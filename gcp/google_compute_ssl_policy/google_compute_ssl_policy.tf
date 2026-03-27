resource "google_compute_ssl_policy" "this" {
  custom_features = var.custom_features
  description     = var.description
  min_tls_version = var.min_tls_version
  name            = var.name
  profile         = var.profile

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
