resource "google_service_networking_connection" "this" {
  network                 = var.network
  service                 = var.service
  reserved_peering_ranges = var.reserved_peering_ranges
}