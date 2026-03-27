resource "google_compute_address" "this" {
  name = var.name

  address_type       = var.address_type
  description        = var.description
  ip_version         = var.ip_version
  ipv6_endpoint_type = var.ipv6_endpoint_type
  labels             = var.labels
  network            = var.network
}
