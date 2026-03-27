variables {
  name                       = "subnet"
  description                = "some desc"
  network                    = "network"
  ip_cidr_range              = "0.0.0.0/0"
  private_ipv6_google_access = null
  reserved_internal_range    = "networkconnectivity.googleapis.com/projects/{project}/locations/global/internalRanges/{rangeId}"
  purpose                    = "PRIVATE"
  role                       = "BACKUP"
  secondary_ip_range = [
    {
      range_name              = "range"
      ip_cidr_range           = "0.0.0.0/0"
      reserved_internal_range = "networkconnectivity.googleapis.com/projects/{project}/locations/global/internalRanges/{rangeId}"
    }
  ]
  private_ip_google_access         = true
  stack_type                       = "IPV4_IPV6"
  ipv6_access_type                 = "EXTERNAL"
  external_ipv6_prefix             = "prefix"
  send_secondary_ip_range_if_empty = true
  log_config = [{
       aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.7
    metadata             = "INCLUDE_ALL_METADATA"
    metadata_fields      = []
    filter_expr          = ""
  }]
}

run "test" {
  command = plan

  assert {
    condition     = google_compute_subnetwork.this.name == "subnet"
    error_message = "google_compute_subnetwork did not create correctly"
  }
}