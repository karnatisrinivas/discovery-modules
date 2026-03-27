variables {
  name               = ""
  network            = ""
  address_type       = ""
  description        = ""
  ip_version         = ""
  ipv6_endpoint_type = ""
  labels             = {}
}
run "test" {
  command = plan
  assert {
    condition     = google_compute_address.this.name != null
    error_message = "google_compute_address was not succesful"
  }
}
