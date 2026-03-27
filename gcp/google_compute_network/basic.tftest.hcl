variables {
  name                                      = "network"
  description                               = "desc"
  auto_create_subnetworks                   = true
  routing_mode                              = "GLOBAL"
  mtu                                       = 8896
  enable_ula_internal_ipv6                  = true
  internal_ipv6_range                       = null
  network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
  delete_default_routes_on_create           = true
}

run "test" {
  command = plan

  assert {
    condition     = google_compute_network.this.name == "network"
    error_message = "google_compute_network did not create correctly"
  }
}