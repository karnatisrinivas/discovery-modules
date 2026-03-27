resource "google_compute_instance_group_membership" "this" {
  instance       = var.instance
  instance_group = var.instance_group
  zone           = var.zone

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

}
