resource "google_compute_instance_settings" "this" {
  zone = var.zone

  dynamic "metadata" {
    for_each = var.metadata
    content {
      items = metadata.value.items
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
