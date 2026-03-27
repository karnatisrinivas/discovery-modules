resource "google_compute_disk" "this" {
  access_mode                           = var.access_mode
  architecture                          = var.architecture
  create_snapshot_before_destroy        = var.create_snapshot_before_destroy
  create_snapshot_before_destroy_prefix = var.create_snapshot_before_destroy_prefix
  description                           = var.description
  enable_confidential_compute           = var.enable_confidential_compute
  image                                 = var.image
  labels                                = var.labels
  licenses                              = var.licenses
  name                                  = var.name
  physical_block_size_bytes             = var.physical_block_size_bytes
  provisioned_iops                      = var.provisioned_iops
  provisioned_throughput                = var.provisioned_throughput
  size                                  = var.size
  snapshot                              = var.snapshot
  source_disk                           = var.source_disk
  source_instant_snapshot               = var.source_instant_snapshot
  source_storage_object                 = var.source_storage_object
  storage_pool                          = var.storage_pool
  type                                  = var.type
  zone                                  = var.zone

  dynamic "async_primary_disk" {
    for_each = var.async_primary_disk
    content {
      disk = async_primary_disk.value.disk
    }
  }

  dynamic "disk_encryption_key" {
    for_each = var.disk_encryption_key
    content {
      kms_key_self_link       = disk_encryption_key.value.kms_key_self_link
      kms_key_service_account = disk_encryption_key.value.kms_key_service_account
      raw_key                 = disk_encryption_key.value.raw_key
      rsa_encrypted_key       = disk_encryption_key.value.rsa_encrypted_key
    }
  }

  dynamic "guest_os_features" {
    for_each = var.guest_os_features
    content {
      type = guest_os_features.value.type
    }
  }

  dynamic "params" {
    for_each = var.params
    content {
      resource_manager_tags = params.value.resource_manager_tags
    }
  }

  dynamic "source_image_encryption_key" {
    for_each = var.source_image_encryption_key
    content {
      kms_key_self_link       = source_image_encryption_key.value.kms_key_self_link
      kms_key_service_account = source_image_encryption_key.value.kms_key_service_account
      raw_key                 = source_image_encryption_key.value.raw_key
    }
  }

  dynamic "source_snapshot_encryption_key" {
    for_each = var.source_snapshot_encryption_key
    content {
      kms_key_self_link       = source_snapshot_encryption_key.value.kms_key_self_link
      kms_key_service_account = source_snapshot_encryption_key.value.kms_key_service_account
      raw_key                 = source_snapshot_encryption_key.value.raw_key
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
