resource "google_compute_disk_resource_policy_attachment" "this" {
  disk = var.disk
  name = var.name
  zone = var.zone

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

}
