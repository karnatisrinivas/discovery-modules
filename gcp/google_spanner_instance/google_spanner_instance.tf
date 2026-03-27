resource "google_spanner_instance" "this" {
  config                       = var.config
  default_backup_schedule_type = var.default_backup_schedule_type
  display_name                 = var.display_name
  edition                      = var.edition
  force_destroy                = var.force_destroy
  labels                       = var.labels
  name                         = var.name
  num_nodes                    = var.num_nodes
  processing_units             = var.processing_units

  dynamic "autoscaling_config" {
    for_each = var.autoscaling_config
    content {
      dynamic "asymmetric_autoscaling_options" {
        for_each = autoscaling_config.value.asymmetric_autoscaling_options
        content {
          dynamic "overrides" {
            for_each = asymmetric_autoscaling_options.value.overrides
            content {
              dynamic "autoscaling_limits" {
                for_each = overrides.value.autoscaling_limits
                content {
                  max_nodes = autoscaling_limits.value.max_nodes
                  min_nodes = autoscaling_limits.value.min_nodes
                }
              }

            }
          }

          dynamic "replica_selection" {
            for_each = asymmetric_autoscaling_options.value.replica_selection
            content {
              location = replica_selection.value.location
            }
          }

        }
      }

      dynamic "autoscaling_limits" {
        for_each = autoscaling_config.value.autoscaling_limits
        content {
          max_nodes            = autoscaling_limits.value.max_nodes
          max_processing_units = autoscaling_limits.value.max_processing_units
          min_nodes            = autoscaling_limits.value.min_nodes
          min_processing_units = autoscaling_limits.value.min_processing_units
        }
      }

      dynamic "autoscaling_targets" {
        for_each = autoscaling_config.value.autoscaling_targets
        content {
          high_priority_cpu_utilization_percent = autoscaling_targets.value.high_priority_cpu_utilization_percent
          storage_utilization_percent           = autoscaling_targets.value.storage_utilization_percent
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
