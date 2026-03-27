resource "aws_networkfirewall_firewall_policy" "this" {
  description = var.description
  name        = var.name
  tags        = var.tags

  dynamic "encryption_configuration" {
    for_each = var.encryption_configuration
    content {
      key_id = encryption_configuration.value.key_id
      type   = encryption_configuration.value.type
    }
  }

  dynamic "firewall_policy" {
    for_each = var.firewall_policy
    content {
      stateful_default_actions           = firewall_policy.value.stateful_default_actions
      stateless_default_actions          = firewall_policy.value.stateless_default_actions
      stateless_fragment_default_actions = firewall_policy.value.stateless_fragment_default_actions
      tls_inspection_configuration_arn   = firewall_policy.value.tls_inspection_configuration_arn

      dynamic "policy_variables" {
        for_each = firewall_policy.value.policy_variables
        content {
          dynamic "rule_variables" {
            for_each = policy_variables.value.rule_variables
            content {
              key = rule_variables.value.key

              dynamic "ip_set" {
                for_each = rule_variables.value.ip_set
                content {
                  definition = ip_set.value.definition
                }
              }

            }
          }

        }
      }

      dynamic "stateful_engine_options" {
        for_each = firewall_policy.value.stateful_engine_options
        content {
          rule_order              = stateful_engine_options.value.rule_order
          stream_exception_policy = stateful_engine_options.value.stream_exception_policy

          dynamic "flow_timeouts" {
            for_each = stateful_engine_options.value.flow_timeouts
            content {
              tcp_idle_timeout_seconds = flow_timeouts.value.tcp_idle_timeout_seconds
            }
          }

        }
      }

      dynamic "stateful_rule_group_reference" {
        for_each = firewall_policy.value.stateful_rule_group_reference
        content {
          priority     = stateful_rule_group_reference.value.priority
          resource_arn = stateful_rule_group_reference.value.resource_arn

          dynamic "override" {
            for_each = stateful_rule_group_reference.value.override
            content {
              action = override.value.action
            }
          }

        }
      }

      dynamic "stateless_custom_action" {
        for_each = firewall_policy.value.stateless_custom_action
        content {
          action_name = stateless_custom_action.value.action_name

          dynamic "action_definition" {
            for_each = stateless_custom_action.value.action_definition
            content {
              dynamic "publish_metric_action" {
                for_each = action_definition.value.publish_metric_action
                content {
                  dynamic "dimension" {
                    for_each = publish_metric_action.value.dimension
                    content {
                      value = dimension.value.value
                    }
                  }

                }
              }

            }
          }

        }
      }

      dynamic "stateless_rule_group_reference" {
        for_each = firewall_policy.value.stateless_rule_group_reference
        content {
          priority     = stateless_rule_group_reference.value.priority
          resource_arn = stateless_rule_group_reference.value.resource_arn
        }
      }

    }
  }

}
