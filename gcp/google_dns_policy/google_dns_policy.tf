resource "google_dns_policy" "this" {
  description               = var.description
  enable_inbound_forwarding = var.enable_inbound_forwarding
  enable_logging            = var.enable_logging
  name                      = var.name

  dynamic "alternative_name_server_config" {
    for_each = var.alternative_name_server_config
    content {
      dynamic "target_name_servers" {
        for_each = alternative_name_server_config.value.target_name_servers
        content {
          forwarding_path = target_name_servers.value.forwarding_path
          ipv4_address    = target_name_servers.value.ipv4_address
        }
      }

    }
  }

  dynamic "networks" {
    for_each = var.networks
    content {
      network_url = networks.value.network_url
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
