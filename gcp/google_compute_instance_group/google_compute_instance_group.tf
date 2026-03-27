resource "google_compute_instance_group" "this" {
  description = var.description
  instances   = var.instances
  name        = var.name
  network     = var.network
  zone        = var.zone

  dynamic "named_port" {
    for_each = var.named_port
    content {
      name = named_port.value.name
      port = named_port.value.port
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
