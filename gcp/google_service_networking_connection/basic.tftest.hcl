variables {
  network                 = "projects/example-gcp-project/global/networks/default"
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = ["test-global-address"]
}

run "test" {
  command = apply
  assert {
    condition     = google_service_networking_connection.this.network == "projects/example-gcp-project/global/networks/default"
    error_message = "Service Networking Connection is not created appropriately."
  }
}