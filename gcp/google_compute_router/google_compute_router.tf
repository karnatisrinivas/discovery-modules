resource "google_compute_router" "this" {
  name                          = var.name
  network                       = var.network
  encrypted_interconnect_router = var.encrypted_interconnect_router

  dynamic "bgp" {
    for_each = var.bgp
    content {
      asn               = bgp.value.asn
      advertise_mode    = bgp.value.advertise_mode
      advertised_groups = bgp.value.advertise_mode == "CUSTOM" ? [bgp.value.advertised_groups] : null

      dynamic "advertised_ip_ranges" {
        for_each = bgp.value.advertise_mode == "CUSTOM" ? bgp.value.advertised_ip_ranges : []
        content {
          range = advertised_ip_ranges.value.range
        }
      }
      keepalive_interval = bgp.value.keepalive_interval
    }
  }
}