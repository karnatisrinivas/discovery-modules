resource "google_compute_region_target_https_proxy" "this" {
  certificate_manager_certificates = var.certificate_manager_certificates
  description                      = var.description
  http_keep_alive_timeout_sec      = var.http_keep_alive_timeout_sec
  name                             = var.name
  server_tls_policy                = var.server_tls_policy
  ssl_certificates                 = var.ssl_certificates
  ssl_policy                       = var.ssl_policy
  url_map                          = var.url_map

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
