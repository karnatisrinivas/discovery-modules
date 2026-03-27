resource "google_compute_image" "this" {
  description       = var.description
  disk_size_gb      = var.disk_size_gb
  family            = var.family
  labels            = var.labels
  licenses          = var.licenses
  name              = var.name
  source_disk       = var.source_disk
  source_image      = var.source_image
  source_snapshot   = var.source_snapshot
  storage_locations = var.storage_locations

  dynamic "guest_os_features" {
    for_each = var.guest_os_features
    content {
      type = guest_os_features.value.type
    }
  }

  dynamic "image_encryption_key" {
    for_each = var.image_encryption_key
    content {
      kms_key_self_link       = image_encryption_key.value.kms_key_self_link
      kms_key_service_account = image_encryption_key.value.kms_key_service_account
      raw_key                 = image_encryption_key.value.raw_key
      rsa_encrypted_key       = image_encryption_key.value.rsa_encrypted_key
    }
  }

  dynamic "raw_disk" {
    for_each = var.raw_disk
    content {
      container_type = raw_disk.value.container_type
      sha1           = raw_disk.value.sha1
      source         = raw_disk.value.source
    }
  }

  dynamic "shielded_instance_initial_state" {
    for_each = var.shielded_instance_initial_state
    content {
      dynamic "dbs" {
        for_each = shielded_instance_initial_state.value.dbs
        content {
          content   = dbs.value.content
          file_type = dbs.value.file_type
        }
      }

      dynamic "dbxs" {
        for_each = shielded_instance_initial_state.value.dbxs
        content {
          content   = dbxs.value.content
          file_type = dbxs.value.file_type
        }
      }

      dynamic "keks" {
        for_each = shielded_instance_initial_state.value.keks
        content {
          content   = keks.value.content
          file_type = keks.value.file_type
        }
      }

      dynamic "pk" {
        for_each = shielded_instance_initial_state.value.pk
        content {
          content   = pk.value.content
          file_type = pk.value.file_type
        }
      }

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

  dynamic "source_image_encryption_key" {
    for_each = var.source_image_encryption_key
    content {
      kms_key_self_link       = source_image_encryption_key.value.kms_key_self_link
      kms_key_service_account = source_image_encryption_key.value.kms_key_service_account
      raw_key                 = source_image_encryption_key.value.raw_key
      rsa_encrypted_key       = source_image_encryption_key.value.rsa_encrypted_key
    }
  }

  dynamic "source_snapshot_encryption_key" {
    for_each = var.source_snapshot_encryption_key
    content {
      kms_key_self_link       = source_snapshot_encryption_key.value.kms_key_self_link
      kms_key_service_account = source_snapshot_encryption_key.value.kms_key_service_account
      raw_key                 = source_snapshot_encryption_key.value.raw_key
      rsa_encrypted_key       = source_snapshot_encryption_key.value.rsa_encrypted_key
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
