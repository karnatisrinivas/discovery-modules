resource "aws_dlm_lifecycle_policy" "this" {
  description        = var.description
  execution_role_arn = var.execution_role_arn
  state              = var.state
  tags               = var.tags

  dynamic "policy_details" {
    for_each = var.policy_details
    content {
      policy_type        = policy_details.value.policy_type
      resource_locations = policy_details.value.resource_locations
      resource_types     = policy_details.value.resource_types
      target_tags        = policy_details.value.target_tags

      dynamic "action" {
        for_each = policy_details.value.action
        content {
          name = action.value.name

          dynamic "cross_region_copy" {
            for_each = action.value.cross_region_copy
            content {
              target = cross_region_copy.value.target

              dynamic "encryption_configuration" {
                for_each = cross_region_copy.value.encryption_configuration
                content {
                  cmk_arn   = encryption_configuration.value.cmk_arn
                  encrypted = encryption_configuration.value.encrypted
                }
              }

              dynamic "retain_rule" {
                for_each = cross_region_copy.value.retain_rule
                content {
                  interval      = retain_rule.value.interval
                  interval_unit = retain_rule.value.interval_unit
                }
              }

            }
          }

        }
      }

      dynamic "event_source" {
        for_each = policy_details.value.event_source
        content {
          type = event_source.value.type

          dynamic "parameters" {
            for_each = event_source.value.parameters
            content {
              description_regex = parameters.value.description_regex
              event_type        = parameters.value.event_type
              snapshot_owner    = parameters.value.snapshot_owner
            }
          }

        }
      }

      dynamic "parameters" {
        for_each = policy_details.value.parameters
        content {
          exclude_boot_volume = parameters.value.exclude_boot_volume
          no_reboot           = parameters.value.no_reboot
        }
      }

      dynamic "schedule" {
        for_each = policy_details.value.schedule
        content {
          copy_tags     = schedule.value.copy_tags
          name          = schedule.value.name
          tags_to_add   = schedule.value.tags_to_add
          variable_tags = schedule.value.variable_tags

          dynamic "create_rule" {
            for_each = schedule.value.create_rule
            content {
              cron_expression = create_rule.value.cron_expression
              interval        = create_rule.value.interval
              interval_unit   = create_rule.value.interval_unit
              location        = create_rule.value.location
              times           = create_rule.value.times
            }
          }

          dynamic "cross_region_copy_rule" {
            for_each = schedule.value.cross_region_copy_rule
            content {
              cmk_arn   = cross_region_copy_rule.value.cmk_arn
              copy_tags = cross_region_copy_rule.value.copy_tags
              encrypted = cross_region_copy_rule.value.encrypted
              target    = cross_region_copy_rule.value.target

              dynamic "deprecate_rule" {
                for_each = cross_region_copy_rule.value.deprecate_rule
                content {
                  interval      = deprecate_rule.value.interval
                  interval_unit = deprecate_rule.value.interval_unit
                }
              }

              dynamic "retain_rule" {
                for_each = cross_region_copy_rule.value.retain_rule
                content {
                  interval      = retain_rule.value.interval
                  interval_unit = retain_rule.value.interval_unit
                }
              }

            }
          }

          dynamic "deprecate_rule" {
            for_each = schedule.value.deprecate_rule
            content {
              count         = deprecate_rule.value.count
              interval      = deprecate_rule.value.interval
              interval_unit = deprecate_rule.value.interval_unit
            }
          }

          dynamic "fast_restore_rule" {
            for_each = schedule.value.fast_restore_rule
            content {
              availability_zones = fast_restore_rule.value.availability_zones
              count              = fast_restore_rule.value.count
              interval           = fast_restore_rule.value.interval
              interval_unit      = fast_restore_rule.value.interval_unit
            }
          }

          dynamic "retain_rule" {
            for_each = schedule.value.retain_rule
            content {
              count         = retain_rule.value.count
              interval      = retain_rule.value.interval
              interval_unit = retain_rule.value.interval_unit
            }
          }

          dynamic "share_rule" {
            for_each = schedule.value.share_rule
            content {
              target_accounts       = share_rule.value.target_accounts
              unshare_interval      = share_rule.value.unshare_interval
              unshare_interval_unit = share_rule.value.unshare_interval_unit
            }
          }

        }
      }

    }
  }

}
