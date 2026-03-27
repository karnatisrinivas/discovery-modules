variables {
  name    = "test-router"
  network = "default"
  bgp = [{
    asn               = 64514
    advertise_mode    = "CUSTOM"
    advertised_groups = "ALL_SUBNETS"
    advertised_ip_ranges = [
      {
        range = "6.7.0.0/16"
      },
      {
        range = "10.255.0.0/20"
      }
    ]
  }]
  encrypted_interconnect_router = false
}

run "test" {
  command = apply
  assert {
    condition     = google_compute_router.this.name == "test-router"
    error_message = "The router is not created successfully"
  }
}