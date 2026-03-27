data "google_compute_subnetworks" "this" {
  filter = var.filter
}