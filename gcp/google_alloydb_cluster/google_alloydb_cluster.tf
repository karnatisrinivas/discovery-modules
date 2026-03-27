resource "google_alloydb_cluster" "this" {
  annotations                      = var.annotations
  cluster_id                       = var.cluster_id
  cluster_type                     = var.cluster_type
  database_version                 = var.database_version
  deletion_policy                  = var.deletion_policy
  display_name                     = var.display_name
  etag                             = var.etag
  labels                           = var.labels
  location                         = var.location
  skip_await_major_version_upgrade = var.skip_await_major_version_upgrade
  subscription_type                = var.subscription_type

  dynamic "automated_backup_policy" {
    for_each = var.automated_backup_policy
    content {
      backup_window = automated_backup_policy.value.backup_window
      enabled       = automated_backup_policy.value.enabled
      labels        = automated_backup_policy.value.labels
      location      = automated_backup_policy.value.location

      dynamic "encryption_config" {
        for_each = automated_backup_policy.value.encryption_config
        content {
          kms_key_name = encryption_config.value.kms_key_name
        }
      }

      dynamic "quantity_based_retention" {
        for_each = automated_backup_policy.value.quantity_based_retention
        content {
          count = quantity_based_retention.value.count
        }
      }

      dynamic "time_based_retention" {
        for_each = automated_backup_policy.value.time_based_retention
        content {
          retention_period = time_based_retention.value.retention_period
        }
      }

      dynamic "weekly_schedule" {
        for_each = automated_backup_policy.value.weekly_schedule
        content {
          days_of_week = weekly_schedule.value.days_of_week

          dynamic "start_times" {
            for_each = weekly_schedule.value.start_times
            content {
              hours   = start_times.value.hours
              minutes = start_times.value.minutes
              nanos   = start_times.value.nanos
              seconds = start_times.value.seconds
            }
          }

        }
      }

    }
  }

  dynamic "continuous_backup_config" {
    for_each = var.continuous_backup_config
    content {
      enabled              = continuous_backup_config.value.enabled
      recovery_window_days = continuous_backup_config.value.recovery_window_days

      dynamic "encryption_config" {
        for_each = continuous_backup_config.value.encryption_config
        content {
          kms_key_name = encryption_config.value.kms_key_name
        }
      }

    }
  }

  dynamic "encryption_config" {
    for_each = var.encryption_config
    content {
      kms_key_name = encryption_config.value.kms_key_name
    }
  }

  dynamic "initial_user" {
    for_each = var.initial_user
    content {
      password = initial_user.value.password
      user     = initial_user.value.user
    }
  }

  dynamic "maintenance_update_policy" {
    for_each = var.maintenance_update_policy
    content {
      dynamic "maintenance_windows" {
        for_each = maintenance_update_policy.value.maintenance_windows
        content {
          day = maintenance_windows.value.day

          dynamic "start_time" {
            for_each = maintenance_windows.value.start_time
            content {
              hours   = start_time.value.hours
              minutes = start_time.value.minutes
              nanos   = start_time.value.nanos
              seconds = start_time.value.seconds
            }
          }

        }
      }

    }
  }

  dynamic "network_config" {
    for_each = var.network_config
    content {
      allocated_ip_range = network_config.value.allocated_ip_range
      network            = network_config.value.network
    }
  }

  dynamic "psc_config" {
    for_each = var.psc_config
    content {
      psc_enabled = psc_config.value.psc_enabled
    }
  }

  dynamic "restore_backup_source" {
    for_each = var.restore_backup_source
    content {
      backup_name = restore_backup_source.value.backup_name
    }
  }

  dynamic "restore_continuous_backup_source" {
    for_each = var.restore_continuous_backup_source
    content {
      cluster       = restore_continuous_backup_source.value.cluster
      point_in_time = restore_continuous_backup_source.value.point_in_time
    }
  }

  dynamic "secondary_config" {
    for_each = var.secondary_config
    content {
      primary_cluster_name = secondary_config.value.primary_cluster_name
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
