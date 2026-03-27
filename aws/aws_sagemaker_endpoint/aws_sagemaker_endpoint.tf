resource "aws_sagemaker_endpoint" "this" {
  endpoint_config_name = var.endpoint_config_name
  name                 = var.name
  tags                 = var.tags

  dynamic "deployment_config" {
    for_each = var.deployment_config
    content {
      dynamic "auto_rollback_configuration" {
        for_each = deployment_config.value.auto_rollback_configuration
        content {
          dynamic "alarms" {
            for_each = auto_rollback_configuration.value.alarms
            content {
              alarm_name = alarms.value.alarm_name
            }
          }

        }
      }

      dynamic "blue_green_update_policy" {
        for_each = deployment_config.value.blue_green_update_policy
        content {
          maximum_execution_timeout_in_seconds = blue_green_update_policy.value.maximum_execution_timeout_in_seconds
          termination_wait_in_seconds          = blue_green_update_policy.value.termination_wait_in_seconds

          dynamic "traffic_routing_configuration" {
            for_each = blue_green_update_policy.value.traffic_routing_configuration
            content {
              type                     = traffic_routing_configuration.value.type
              wait_interval_in_seconds = traffic_routing_configuration.value.wait_interval_in_seconds

              dynamic "canary_size" {
                for_each = traffic_routing_configuration.value.canary_size
                content {
                  type  = canary_size.value.type
                  value = canary_size.value.value
                }
              }

              dynamic "linear_step_size" {
                for_each = traffic_routing_configuration.value.linear_step_size
                content {
                  type  = linear_step_size.value.type
                  value = linear_step_size.value.value
                }
              }

            }
          }

        }
      }

      dynamic "rolling_update_policy" {
        for_each = deployment_config.value.rolling_update_policy
        content {
          maximum_execution_timeout_in_seconds = rolling_update_policy.value.maximum_execution_timeout_in_seconds
          wait_interval_in_seconds             = rolling_update_policy.value.wait_interval_in_seconds

          dynamic "maximum_batch_size" {
            for_each = rolling_update_policy.value.maximum_batch_size
            content {
              type  = maximum_batch_size.value.type
              value = maximum_batch_size.value.value
            }
          }

          dynamic "rollback_maximum_batch_size" {
            for_each = rolling_update_policy.value.rollback_maximum_batch_size
            content {
              type  = rollback_maximum_batch_size.value.type
              value = rollback_maximum_batch_size.value.value
            }
          }

        }
      }

    }
  }

}
