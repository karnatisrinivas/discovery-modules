resource "google_compute_router_peer" "this" {
  advertise_mode                     = var.advertise_mode
  advertised_groups                  = var.advertised_groups
  advertised_route_priority          = var.advertised_route_priority
  custom_learned_route_priority      = var.custom_learned_route_priority
  enable                             = var.enable
  enable_ipv4                        = var.enable_ipv4
  enable_ipv6                        = var.enable_ipv6
  export_policies                    = var.export_policies
  import_policies                    = var.import_policies
  interface                          = var.interface
  ip_address                         = var.ip_address
  ipv4_nexthop_address               = var.ipv4_nexthop_address
  ipv6_nexthop_address               = var.ipv6_nexthop_address
  name                               = var.name
  peer_asn                           = var.peer_asn
  peer_ip_address                    = var.peer_ip_address
  peer_ipv4_nexthop_address          = var.peer_ipv4_nexthop_address
  peer_ipv6_nexthop_address          = var.peer_ipv6_nexthop_address
  router                             = var.router
  router_appliance_instance          = var.router_appliance_instance
  zero_advertised_route_priority     = var.zero_advertised_route_priority
  zero_custom_learned_route_priority = var.zero_custom_learned_route_priority

  dynamic "advertised_ip_ranges" {
    for_each = var.advertised_ip_ranges
    content {
      description = advertised_ip_ranges.value.description
      range       = advertised_ip_ranges.value.range
    }
  }

  dynamic "bfd" {
    for_each = var.bfd
    content {
      min_receive_interval        = bfd.value.min_receive_interval
      min_transmit_interval       = bfd.value.min_transmit_interval
      multiplier                  = bfd.value.multiplier
      session_initialization_mode = bfd.value.session_initialization_mode
    }
  }

  dynamic "custom_learned_ip_ranges" {
    for_each = var.custom_learned_ip_ranges
    content {
      range = custom_learned_ip_ranges.value.range
    }
  }

  dynamic "md5_authentication_key" {
    for_each = var.md5_authentication_key
    content {
      key  = md5_authentication_key.value.key
      name = md5_authentication_key.value.name
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
