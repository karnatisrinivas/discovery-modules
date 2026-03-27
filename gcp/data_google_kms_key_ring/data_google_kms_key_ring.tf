data "google_kms_key_ring" "this" {
  name     = var.name
  location = var.location
}