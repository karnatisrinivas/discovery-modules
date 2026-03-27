resource "google_compute_global_forwarding_rule" "this" {
  description           = var.description
  ip_address            = var.ip_address
  ip_protocol           = var.ip_protocol
  ip_version            = var.ip_version
  labels                = var.labels
  load_balancing_scheme = var.load_balancing_scheme
  name                  = var.name
  network               = var.network
  network_tier          = var.network_tier
  no_automate_dns_zone  = var.no_automate_dns_zone
  port_range            = var.port_range
  project               = var.project
  source_ip_ranges      = var.source_ip_ranges
  subnetwork            = var.subnetwork
  target                = var.target

  dynamic "metadata_filters" {
    for_each = var.metadata_filters
    content {
      filter_match_criteria = metadata_filters.value.filter_match_criteria

      dynamic "filter_labels" {
        for_each = metadata_filters.value.filter_labels
        content {
          name  = filter_labels.value.name
          value = filter_labels.value.value
        }
      }

    }
  }

  dynamic "service_directory_registrations" {
    for_each = var.service_directory_registrations
    content {
      namespace                = service_directory_registrations.value.namespace
      service_directory_region = service_directory_registrations.value.service_directory_region
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
