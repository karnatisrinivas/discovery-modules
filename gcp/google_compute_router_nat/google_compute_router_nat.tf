resource "google_compute_router_nat" "this" {
  auto_network_tier                   = var.auto_network_tier
  drain_nat_ips                       = var.drain_nat_ips
  enable_dynamic_port_allocation      = var.enable_dynamic_port_allocation
  enable_endpoint_independent_mapping = var.enable_endpoint_independent_mapping
  endpoint_types                      = var.endpoint_types
  icmp_idle_timeout_sec               = var.icmp_idle_timeout_sec
  initial_nat_ips                     = var.initial_nat_ips
  max_ports_per_vm                    = var.max_ports_per_vm
  min_ports_per_vm                    = var.min_ports_per_vm
  name                                = var.name
  nat_ip_allocate_option              = var.nat_ip_allocate_option
  nat_ips                             = var.nat_ips
  router                              = var.router
  source_subnetwork_ip_ranges_to_nat  = var.source_subnetwork_ip_ranges_to_nat
  tcp_established_idle_timeout_sec    = var.tcp_established_idle_timeout_sec
  tcp_time_wait_timeout_sec           = var.tcp_time_wait_timeout_sec
  tcp_transitory_idle_timeout_sec     = var.tcp_transitory_idle_timeout_sec
  udp_idle_timeout_sec                = var.udp_idle_timeout_sec

  dynamic "log_config" {
    for_each = var.log_config
    content {
      enable = log_config.value.enable
      filter = log_config.value.filter
    }
  }

  dynamic "rules" {
    for_each = var.rules
    content {
      description = rules.value.description
      match       = rules.value.match
      rule_number = rules.value.rule_number

      dynamic "action" {
        for_each = rules.value.action
        content {
          source_nat_active_ips = action.value.source_nat_active_ips
          source_nat_drain_ips  = action.value.source_nat_drain_ips
        }
      }

    }
  }

  dynamic "subnetwork" {
    for_each = var.subnetwork
    content {
      name                     = subnetwork.value.name
      secondary_ip_range_names = subnetwork.value.secondary_ip_range_names
      source_ip_ranges_to_nat  = subnetwork.value.source_ip_ranges_to_nat
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
