resource "aws_route" "this" {
  carrier_gateway_id        = var.carrier_gateway_id != null && var.carrier_gateway_id != "" ? var.carrier_gateway_id : null
  core_network_arn          = var.core_network_arn != null && var.core_network_arn != "" && var.carrier_gateway_id == "" ? var.core_network_arn : null
  egress_only_gateway_id    = var.egress_only_gateway_id != null && var.egress_only_gateway_id != "" && var.carrier_gateway_id == "" && var.core_network_arn == "" ? var.egress_only_gateway_id : null
  gateway_id                = var.gateway_id != null && var.gateway_id != "" && var.carrier_gateway_id == "" && var.core_network_arn == "" && var.egress_only_gateway_id == "" ? var.gateway_id : null
  local_gateway_id          = var.local_gateway_id != null && var.local_gateway_id != "" && var.carrier_gateway_id == "" && var.core_network_arn == "" && var.egress_only_gateway_id == "" && var.gateway_id == "" ? var.local_gateway_id : null
  nat_gateway_id            = var.nat_gateway_id != null && var.nat_gateway_id != "" && var.carrier_gateway_id == "" && var.core_network_arn == "" && var.egress_only_gateway_id == "" && var.gateway_id == "" && var.local_gateway_id == "" ? var.nat_gateway_id : null
  network_interface_id      = var.network_interface_id != null && var.network_interface_id != "" && var.carrier_gateway_id == "" && var.core_network_arn == "" && var.egress_only_gateway_id == "" && var.gateway_id == "" && var.local_gateway_id == "" && var.nat_gateway_id == "" ? var.network_interface_id : null
  transit_gateway_id        = var.transit_gateway_id != null && var.transit_gateway_id != "" && var.carrier_gateway_id == "" && var.core_network_arn == "" && var.egress_only_gateway_id == "" && var.gateway_id == "" && var.local_gateway_id == "" && var.nat_gateway_id == "" && var.network_interface_id == "" ? var.transit_gateway_id : null
  vpc_endpoint_id           = var.vpc_endpoint_id != null && var.vpc_endpoint_id != "" && var.carrier_gateway_id == "" && var.core_network_arn == "" && var.egress_only_gateway_id == "" && var.gateway_id == "" && var.local_gateway_id == "" && var.nat_gateway_id == "" && var.network_interface_id == "" && var.transit_gateway_id == "" ? var.vpc_endpoint_id : null
  vpc_peering_connection_id = var.vpc_peering_connection_id != null && var.vpc_peering_connection_id != "" && var.carrier_gateway_id == "" && var.core_network_arn == "" && var.egress_only_gateway_id == "" && var.gateway_id == "" && var.local_gateway_id == "" && var.nat_gateway_id == "" && var.network_interface_id == "" && var.transit_gateway_id == "" && var.vpc_endpoint_id == "" ? var.vpc_peering_connection_id : null

  destination_cidr_block      = var.destination_cidr_block != null && var.destination_cidr_block != "" ? var.destination_cidr_block : null
  destination_ipv6_cidr_block = var.destination_cidr_block == null || var.destination_cidr_block == "" ? (var.destination_ipv6_cidr_block != null && var.destination_ipv6_cidr_block != "" ? var.destination_ipv6_cidr_block : null) : null
  destination_prefix_list_id  = (var.destination_cidr_block == null || var.destination_cidr_block == "") && (var.destination_ipv6_cidr_block == null || var.destination_ipv6_cidr_block == "") ? (var.destination_prefix_list_id != null && var.destination_prefix_list_id != "" ? var.destination_prefix_list_id : null) : null
  route_table_id              = var.route_table_id

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }
}
