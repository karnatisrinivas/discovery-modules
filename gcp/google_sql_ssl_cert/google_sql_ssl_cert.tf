resource "google_sql_ssl_cert" "this" {
  common_name = var.common_name
  instance    = var.instance

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

}
