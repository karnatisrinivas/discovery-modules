resource "google_access_context_manager_access_policy" "this" {
  parent = var.parent
  scopes = var.scopes
  title  = var.title

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
