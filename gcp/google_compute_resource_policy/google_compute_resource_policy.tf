resource "google_compute_resource_policy" "this" {
  description = var.description
  name        = var.name

  dynamic "disk_consistency_group_policy" {
    for_each = var.disk_consistency_group_policy
    content {
      enabled = disk_consistency_group_policy.value.enabled
    }
  }

  dynamic "group_placement_policy" {
    for_each = var.group_placement_policy
    content {
      availability_domain_count = group_placement_policy.value.availability_domain_count
      collocation               = group_placement_policy.value.collocation
      vm_count                  = group_placement_policy.value.vm_count
    }
  }

  dynamic "instance_schedule_policy" {
    for_each = var.instance_schedule_policy
    content {
      expiration_time = instance_schedule_policy.value.expiration_time
      start_time      = instance_schedule_policy.value.start_time
      time_zone       = instance_schedule_policy.value.time_zone

      dynamic "vm_start_schedule" {
        for_each = instance_schedule_policy.value.vm_start_schedule
        content {
          schedule = vm_start_schedule.value.schedule
        }
      }

      dynamic "vm_stop_schedule" {
        for_each = instance_schedule_policy.value.vm_stop_schedule
        content {
          schedule = vm_stop_schedule.value.schedule
        }
      }

    }
  }

  dynamic "snapshot_schedule_policy" {
    for_each = var.snapshot_schedule_policy
    content {
      dynamic "retention_policy" {
        for_each = snapshot_schedule_policy.value.retention_policy
        content {
          max_retention_days    = retention_policy.value.max_retention_days
          on_source_disk_delete = retention_policy.value.on_source_disk_delete
        }
      }

      dynamic "schedule" {
        for_each = snapshot_schedule_policy.value.schedule
        content {
          dynamic "daily_schedule" {
            for_each = schedule.value.daily_schedule
            content {
              days_in_cycle = daily_schedule.value.days_in_cycle
              start_time    = daily_schedule.value.start_time
            }
          }

          dynamic "hourly_schedule" {
            for_each = schedule.value.hourly_schedule
            content {
              hours_in_cycle = hourly_schedule.value.hours_in_cycle
              start_time     = hourly_schedule.value.start_time
            }
          }

          dynamic "weekly_schedule" {
            for_each = schedule.value.weekly_schedule
            content {
              dynamic "day_of_weeks" {
                for_each = weekly_schedule.value.day_of_weeks
                content {
                  day        = day_of_weeks.value.day
                  start_time = day_of_weeks.value.start_time
                }
              }

            }
          }

        }
      }

      dynamic "snapshot_properties" {
        for_each = snapshot_schedule_policy.value.snapshot_properties
        content {
          chain_name        = snapshot_properties.value.chain_name
          guest_flush       = snapshot_properties.value.guest_flush
          labels            = snapshot_properties.value.labels
          storage_locations = snapshot_properties.value.storage_locations
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
