resource "google_compute_vpn_tunnel" "this" {
  description                     = var.description
  ike_version                     = var.ike_version
  labels                          = var.labels
  local_traffic_selector          = var.local_traffic_selector
  name                            = var.name
  peer_external_gateway           = var.peer_external_gateway
  peer_external_gateway_interface = var.peer_external_gateway_interface
  peer_gcp_gateway                = var.peer_gcp_gateway
  peer_ip                         = var.peer_ip
  remote_traffic_selector         = var.remote_traffic_selector
  router                          = var.router
  shared_secret                   = var.shared_secret
  target_vpn_gateway              = var.target_vpn_gateway
  vpn_gateway                     = var.vpn_gateway
  vpn_gateway_interface           = var.vpn_gateway_interface

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
