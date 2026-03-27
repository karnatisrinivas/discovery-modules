resource "google_resource_manager_lien" "this" {
  origin       = var.origin
  parent       = var.parent
  reason       = var.reason
  restrictions = var.restrictions

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

}
