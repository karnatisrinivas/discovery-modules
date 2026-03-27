resource "google_compute_region_autoscaler" "this" {
  description = var.description
  name        = var.name
  target      = var.target

  dynamic "autoscaling_policy" {
    for_each = var.autoscaling_policy
    content {
      cooldown_period = autoscaling_policy.value.cooldown_period
      max_replicas    = autoscaling_policy.value.max_replicas
      min_replicas    = autoscaling_policy.value.min_replicas
      mode            = autoscaling_policy.value.mode

      dynamic "cpu_utilization" {
        for_each = autoscaling_policy.value.cpu_utilization
        content {
          predictive_method = cpu_utilization.value.predictive_method
          target            = cpu_utilization.value.target
        }
      }

      dynamic "load_balancing_utilization" {
        for_each = autoscaling_policy.value.load_balancing_utilization
        content {
          target = load_balancing_utilization.value.target
        }
      }

      dynamic "metric" {
        for_each = autoscaling_policy.value.metric
        content {
          filter                     = metric.value.filter
          name                       = metric.value.name
          single_instance_assignment = metric.value.single_instance_assignment
          target                     = metric.value.target
          type                       = metric.value.type
        }
      }

      dynamic "scale_in_control" {
        for_each = autoscaling_policy.value.scale_in_control
        content {
          time_window_sec = scale_in_control.value.time_window_sec

          dynamic "max_scaled_in_replicas" {
            for_each = scale_in_control.value.max_scaled_in_replicas
            content {
              fixed   = max_scaled_in_replicas.value.fixed
              percent = max_scaled_in_replicas.value.percent
            }
          }

        }
      }

      dynamic "scaling_schedules" {
        for_each = autoscaling_policy.value.scaling_schedules
        content {
          description           = scaling_schedules.value.description
          disabled              = scaling_schedules.value.disabled
          duration_sec          = scaling_schedules.value.duration_sec
          min_required_replicas = scaling_schedules.value.min_required_replicas
          name                  = scaling_schedules.value.name
          schedule              = scaling_schedules.value.schedule
          time_zone             = scaling_schedules.value.time_zone
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
