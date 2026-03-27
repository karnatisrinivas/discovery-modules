resource "google_network_connectivity_service_connection_policy" "this" {
  description   = var.description
  labels        = var.labels
  location      = var.location
  name          = var.name
  network       = var.network
  service_class = var.service_class

  dynamic "psc_config" {
    for_each = var.psc_config
    content {
      limit       = psc_config.value.limit
      subnetworks = psc_config.value.subnetworks
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
