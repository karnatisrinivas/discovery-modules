variables {
  name          = "test-global-address"
  address_type  = "INTERNAL"
  purpose       = "PRIVATE_SERVICE_CONNECT"
  network       = "default"
  address       = "30.168.0.2"
  prefix_length = 32
  description   = "description"
  ip_version    = "IPV4"
}

run "test" {
  command = apply
  assert {
    condition     = google_compute_global_address.this.name == "test-global-address"
    error_message = "Global address is not created as expected."
  }
}