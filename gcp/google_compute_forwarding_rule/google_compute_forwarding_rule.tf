resource "google_compute_forwarding_rule" "this" {
  all_ports               = var.all_ports
  allow_global_access     = var.allow_global_access
  allow_psc_global_access = var.allow_psc_global_access
  backend_service         = var.backend_service
  description             = var.description
  ip_address              = var.ip_address
  ip_collection           = var.ip_collection
  ip_protocol             = var.ip_protocol
  ip_version              = var.ip_version
  is_mirroring_collector  = var.is_mirroring_collector
  labels                  = var.labels
  load_balancing_scheme   = var.load_balancing_scheme
  name                    = var.name
  network                 = var.network
  network_tier            = var.network_tier
  no_automate_dns_zone    = var.no_automate_dns_zone
  port_range              = var.port_range
  ports                   = var.ports
  recreate_closed_psc     = var.recreate_closed_psc
  service_label           = var.service_label
  source_ip_ranges        = var.source_ip_ranges
  subnetwork              = var.subnetwork
  target                  = var.target

  dynamic "service_directory_registrations" {
    for_each = var.service_directory_registrations
    content {
      namespace = service_directory_registrations.value.namespace
      service   = service_directory_registrations.value.service
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
