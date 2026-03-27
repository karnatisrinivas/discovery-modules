resource "google_compute_network_endpoint_group" "this" {
  default_port          = var.default_port
  description           = var.description
  name                  = var.name
  network               = var.network
  network_endpoint_type = var.network_endpoint_type
  subnetwork            = var.subnetwork
  zone                  = var.zone

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

}
