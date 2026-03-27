resource "google_redis_instance" "this" {
  name           = var.name
  tier           = var.tier
  memory_size_gb = var.memory_size_gb

  location_id             = var.location_id
  alternative_location_id = var.alternative_location_id

  authorized_network = var.authorized_network

  redis_version     = var.redis_version
  display_name      = var.display_name
  reserved_ip_range = var.reserved_ip_range

  labels = var.labels

  auth_enabled = var.auth_enabled
  connect_mode = var.connect_mode

  dynamic "maintenance_policy" {
    for_each = var.maintenance_policy != null ? var.maintenance_policy : []

    content {
      description = maintenance_policy.value.description
      dynamic "weekly_maintenance_window" {
        for_each = maintenance_policy.value.weekly_maintenance_window != null ? maintenance_policy.value.weekly_maintenance_window : []

        content {
          day = weekly_maintenance_window.value.day
          dynamic "start_time" {
            for_each = weekly_maintenance_window.value.start_time != null ? weekly_maintenance_window.value.start_time : [{ hours = 0, minutes = 0, seconds = 0, nanos = 0 }]
            content {
              hours   = start_time.value.hours
              minutes = start_time.value.minutes
              seconds = start_time.value.seconds
              nanos   = start_time.value.nanos
            }
          }
        }
      }
    }
  }

  dynamic "persistence_config" {
    for_each = var.persistence_config
    content {
      persistence_mode        = persistence_config.value.persistence_mode
      rdb_snapshot_period     = persistence_config.value.rdb_snapshot_period
      rdb_snapshot_start_time = persistence_config.value.rdb_snapshot_start_time
    }
  }

  transit_encryption_mode = var.transit_encryption_mode

  # If tier is BASIC, valid value is 0, if its STANDARD and read_replicas_mode is disabled, valid value is 1, otherwise its [1-5]
  replica_count        = var.tier != null ? var.tier == "BASIC" ? 0 : var.read_replicas_mode != null ? var.read_replicas_mode == "READ_REPLICAS_DISABLED" ? 1 : var.replica_count : null : null
  secondary_ip_range   = var.secondary_ip_range
  customer_managed_key = var.customer_managed_key
}

