resource "google_kms_crypto_key" "this" {
  name                          = var.name
  key_ring                      = var.key_ring
  labels                        = var.labels
  rotation_period               = var.rotation_period
  purpose                       = var.purpose
  destroy_scheduled_duration    = var.destroy_scheduled_duration
  import_only                   = var.import_only
  crypto_key_backend            = var.crypto_key_backend
  skip_initial_version_creation = var.skip_initial_version_creation

  dynamic "version_template" {
    for_each = var.version_template

    content {
      algorithm        = version_template.value.algorithm
      protection_level = version_template.value.protection_level
    }
  }
}
