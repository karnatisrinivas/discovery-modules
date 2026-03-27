variables {
  name                               = "test-nat"
  router                             = "test-router"
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  log_config = [{
    enable = true
    filter = "ERRORS_ONLY"
  }]
  subnetwork = []
}

run "test" {
  command = apply
  assert {
    condition     = google_compute_router_nat.this.name == "test-nat"
    error_message = "NAT Router did not create successfully"
  }
}