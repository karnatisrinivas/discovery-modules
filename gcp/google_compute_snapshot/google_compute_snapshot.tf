resource "google_compute_snapshot" "this" {
  chain_name        = var.chain_name
  description       = var.description
  labels            = var.labels
  name              = var.name
  source_disk       = var.source_disk
  storage_locations = var.storage_locations
  zone              = var.zone

  dynamic "snapshot_encryption_key" {
    for_each = var.snapshot_encryption_key
    content {
      kms_key_self_link       = snapshot_encryption_key.value.kms_key_self_link
      kms_key_service_account = snapshot_encryption_key.value.kms_key_service_account
      raw_key                 = snapshot_encryption_key.value.raw_key
      rsa_encrypted_key       = snapshot_encryption_key.value.rsa_encrypted_key
    }
  }

  dynamic "source_disk_encryption_key" {
    for_each = var.source_disk_encryption_key
    content {
      kms_key_self_link       = source_disk_encryption_key.value.kms_key_self_link
      kms_key_service_account = source_disk_encryption_key.value.kms_key_service_account
      raw_key                 = source_disk_encryption_key.value.raw_key
      rsa_encrypted_key       = source_disk_encryption_key.value.rsa_encrypted_key
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
