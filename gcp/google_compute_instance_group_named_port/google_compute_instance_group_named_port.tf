resource "google_compute_instance_group_named_port" "this" {
  group = var.group
  name  = var.name
  port  = var.port
  zone  = var.zone

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

}
