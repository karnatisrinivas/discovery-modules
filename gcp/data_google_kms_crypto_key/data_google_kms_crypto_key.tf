data "google_kms_crypto_key" "this" {
  name     = var.name
  key_ring = var.key_ring
}