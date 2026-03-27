variables {
  name   = "test-forwarding-rule"
  target = "test-target"

  description = "Test forwarding rule description"
  ip_address  = "10.0.0.1"
  ip_protocol = "TCP"
  ip_version  = "IPV4"
  labels = {
    environment = "test"
  }
  load_balancing_scheme = "EXTERNAL"
  network               = "test-network"
  network_tier          = "PREMIUM"
  no_automate_dns_zone  = false
  port_range            = "80-443"
  project               = "test-project"
  source_ip_ranges      = ["10.0.0.0/24"]
  subnetwork            = "test-subnetwork"

  metadata_filters = [
    {
      filter_match_criteria = "MATCH_ANY"
      filter_labels = [
        {
          name  = "test-label"
          value = "test-value"
        }
      ]
    }
  ]

  service_directory_registrations = [
    {
      namespace                = "test-namespace"
      service_directory_region = "us-central1"
    }
  ]

  timeouts = {
    create = "4h"
    delete = "4h"
    update = "4h"
  }
}

run "create_forwarding_rule" {
  command = plan

  assert {
    condition     = google_compute_global_forwarding_rule.this.name == var.name
    error_message = "Forwarding rule name did not match expected value"
  }
}
