resource "azurerm_monitor_autoscale_setting" "this" {
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  target_resource_id  = var.target_resource_id
  tags                = var.tags

  profile {
    name = "defaultProfile"

    capacity {
      default = var.capacity_default
      maximum = var.capacity_maximum
      minimum = var.capacity_minimum
    }

    dynamic "rule" {
      for_each = var.rules != null ? var.rules : []
      content {
        metric_trigger {
          metric_name        = rule.value.metric_name
          metric_resource_id = rule.value.metric_resource_id
          time_grain         = rule.value.time_grain
          statistic          = rule.value.statistic
          time_window        = rule.value.time_window
          time_aggregation   = rule.value.time_aggregation
          operator           = rule.value.operator
          threshold          = rule.value.threshold

          dynamic "dimensions" {
            for_each = (rule.value.metric_dimension_name != null && rule.value.metric_dimension_name != "") ? [1] : []
            content {
              name     = rule.value.metric_dimension_name
              operator = rule.value.metric_dimension_operator
              values   = rule.value.metric_dimension_values
            }
          }
        }

        scale_action {
          direction = rule.value.scale_action_direction
          type      = rule.value.scale_action_type
          value     = rule.value.scale_action_value
          cooldown  = rule.value.scale_action_cooldown
        }
      }
    }
  }

  predictive {
    scale_mode      = var.scale_mode
    look_ahead_time = var.look_ahead_time
  }

  notification {
    email {
      custom_emails = var.email_ids_for_notifications
    }
  }
}