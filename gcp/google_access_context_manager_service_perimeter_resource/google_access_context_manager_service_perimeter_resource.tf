resource "google_access_context_manager_service_perimeter_resource" "this" {
  perimeter_name = var.perimeter_name
  resource       = var.resource

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

}
