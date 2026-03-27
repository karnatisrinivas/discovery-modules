variables {
  name        = "firewall"
  network     = "network"
  source_tags = ["web"]
  allow = [
    {
      protocol = "tcp"
      ports    = ["88"]
    },
    {
      protocol = "icpm"
      ports    = ["1234"]
    }
  ]
}

run "test" {
  command = plan

  assert {
    condition     = google_compute_firewall.this.name == "firewall"
    error_message = "google_compute_firewall did not create correctly"
  }
}