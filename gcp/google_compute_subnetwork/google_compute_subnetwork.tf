resource "google_compute_subnetwork" "this" {
  name                             = var.name
  network                          = var.network
  ip_cidr_range                    = var.ip_cidr_range
  private_ipv6_google_access       = var.private_ipv6_google_access
  description                      = var.description
  reserved_internal_range          = var.reserved_internal_range
  purpose                          = var.purpose
  role                             = var.role
  private_ip_google_access         = var.private_ip_google_address
  stack_type                       = var.stack_type
  ipv6_access_type                 = var.ipv6_access_type
  external_ipv6_prefix             = var.external_ipv6_prefix
  send_secondary_ip_range_if_empty = var.send_secondary_ip_range_if_empty

  dynamic "secondary_ip_range" {
    for_each = var.secondary_ip_range

    content {
      range_name              = secondary_ip_range.value.range_name
      ip_cidr_range           = secondary_ip_range.value.ip_cidr_range
      reserved_internal_range = secondary_ip_range.value.reserved_internal_range
    }
  }

  dynamic "log_config" {
    for_each = var.log_config

    content {
      aggregation_interval = log_config.value.aggregation_interval
      flow_sampling        = log_config.value.flow_sampling
      metadata             = log_config.value.metadata
      metadata_fields      = log_config.value.metadata_fields
      filter_expr          = log_config.value.filter_expr
    }
  }
}