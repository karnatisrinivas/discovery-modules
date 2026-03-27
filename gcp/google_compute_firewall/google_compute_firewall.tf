resource "google_compute_firewall" "this" {
  description             = var.description
  destination_ranges      = var.destination_ranges
  direction               = var.direction
  disabled                = var.disabled
  enable_logging          = var.enable_logging
  name                    = var.name
  network                 = var.network
  priority                = var.priority
  source_ranges           = var.source_ranges
  source_service_accounts = length(var.source_service_accounts) > 0 ? var.source_service_accounts : null
  source_tags             = var.source_tags
  target_service_accounts = length(var.target_service_accounts) > 0 ? var.target_service_accounts : null
  target_tags             = var.target_tags

  dynamic "allow" {
    for_each = var.allow
    content {
      ports    = allow.value.ports
      protocol = allow.value.protocol
    }
  }

  dynamic "deny" {
    for_each = var.deny
    content {
      ports    = deny.value.ports
      protocol = deny.value.protocol
    }
  }

  dynamic "log_config" {
    for_each = var.log_config
    content {
      metadata = log_config.value.metadata
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
