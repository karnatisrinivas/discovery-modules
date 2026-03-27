resource "google_filestore_instance" "this" {
  deletion_protection_enabled = var.deletion_protection_enabled
  deletion_protection_reason  = var.deletion_protection_reason
  description                 = var.description
  kms_key_name                = var.kms_key_name
  labels                      = var.labels
  location                    = var.location
  name                        = var.name
  protocol                    = var.protocol
  tags                        = var.tags
  tier                        = var.tier
  zone                        = var.zone

  dynamic "file_shares" {
    for_each = var.file_shares
    content {
      capacity_gb   = file_shares.value.capacity_gb
      name          = file_shares.value.name
      source_backup = file_shares.value.source_backup

      dynamic "nfs_export_options" {
        for_each = file_shares.value.nfs_export_options
        content {
          access_mode = nfs_export_options.value.access_mode
          anon_gid    = nfs_export_options.value.anon_gid
          anon_uid    = nfs_export_options.value.anon_uid
          ip_ranges   = nfs_export_options.value.ip_ranges
          squash_mode = nfs_export_options.value.squash_mode
        }
      }

    }
  }

  dynamic "initial_replication" {
    for_each = var.initial_replication
    content {
      role = initial_replication.value.role

      dynamic "replicas" {
        for_each = initial_replication.value.replicas
        content {
          peer_instance = replicas.value.peer_instance
        }
      }

    }
  }

  dynamic "networks" {
    for_each = var.networks
    content {
      connect_mode      = networks.value.connect_mode
      modes             = networks.value.modes
      network           = networks.value.network
      reserved_ip_range = networks.value.reserved_ip_range
    }
  }

  dynamic "performance_config" {
    for_each = var.performance_config
    content {
      dynamic "fixed_iops" {
        for_each = performance_config.value.fixed_iops
        content {
          max_iops = fixed_iops.value.max_iops
        }
      }

      dynamic "iops_per_tb" {
        for_each = performance_config.value.iops_per_tb
        content {
          max_iops_per_tb = iops_per_tb.value.max_iops_per_tb
        }
      }

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
