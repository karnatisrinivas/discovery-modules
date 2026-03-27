resource "google_redis_cluster" "this" {
  authorization_mode          = var.authorization_mode
  deletion_protection_enabled = var.deletion_protection_enabled
  kms_key                     = var.kms_key
  name                        = var.name
  node_type                   = var.node_type
  redis_configs               = var.redis_configs
  replica_count               = var.replica_count
  shard_count                 = var.shard_count
  transit_encryption_mode     = var.transit_encryption_mode

  dynamic "automated_backup_config" {
    for_each = var.automated_backup_config
    content {
      retention = automated_backup_config.value.retention

      dynamic "fixed_frequency_schedule" {
        for_each = automated_backup_config.value.fixed_frequency_schedule
        content {
          dynamic "start_time" {
            for_each = fixed_frequency_schedule.value.start_time
            content {
              hours = start_time.value.hours
            }
          }

        }
      }

    }
  }

  dynamic "cross_cluster_replication_config" {
    for_each = var.cross_cluster_replication_config
    content {
      cluster_role = cross_cluster_replication_config.value.cluster_role

      dynamic "primary_cluster" {
        for_each = cross_cluster_replication_config.value.primary_cluster
        content {
          cluster = primary_cluster.value.cluster
        }
      }

      dynamic "secondary_clusters" {
        for_each = cross_cluster_replication_config.value.secondary_clusters
        content {
          cluster = secondary_clusters.value.cluster
        }
      }

    }
  }

  dynamic "maintenance_policy" {
    for_each = var.maintenance_policy
    content {

      dynamic "weekly_maintenance_window" {
        for_each = maintenance_policy.value.weekly_maintenance_window
        content {
          day = weekly_maintenance_window.value.day

          dynamic "start_time" {
            for_each = weekly_maintenance_window.value.start_time
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

  dynamic "persistence_config" {
    for_each = var.persistence_config
    content {
      mode = persistence_config.value.mode

      dynamic "aof_config" {
        for_each = persistence_config.value.aof_config
        content {
          append_fsync = aof_config.value.append_fsync
        }
      }

      dynamic "rdb_config" {
        for_each = persistence_config.value.rdb_config
        content {
          rdb_snapshot_period     = rdb_config.value.rdb_snapshot_period
          rdb_snapshot_start_time = rdb_config.value.rdb_snapshot_start_time
        }
      }

    }
  }

  dynamic "psc_configs" {
    for_each = var.psc_configs
    content {
      network = psc_configs.value.network
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

  dynamic "zone_distribution_config" {
    for_each = var.zone_distribution_config
    content {
      mode = zone_distribution_config.value.mode
      zone = zone_distribution_config.value.zone
    }
  }

}
