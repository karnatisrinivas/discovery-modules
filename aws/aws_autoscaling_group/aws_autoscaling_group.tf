resource "aws_autoscaling_group" "this" {

  protect_from_scale_in = var.protect_from_scale_in
  suspended_processes   = var.suspended_processes
  dynamic "launch_template" {
    for_each = var.launch_template
    content {
      id      = launch_template.value.id
      name    = launch_template.value.id == "" ? launch_template.value.name : null
      version = launch_template.value.version
    }

  }
  launch_configuration = length(var.launch_template) > 0 ? null : (length(var.mixed_instances_policy) > 0 ? null : var.launch_configuration)
  dynamic "mixed_instances_policy" {
    for_each = var.mixed_instances_policy
    content {
      dynamic "instances_distribution" {
        for_each = mixed_instances_policy.value.instances_distribution
        content {
          on_demand_base_capacity                  = instances_distribution.value.on_demand_base_capacity
          on_demand_percentage_above_base_capacity = instances_distribution.value.on_demand_percentage_above_base_capacity
          spot_allocation_strategy                 = instances_distribution.value.spot_allocation_strategy
          spot_instance_pools                      = instances_distribution.value.spot_instance_pools
          spot_max_price                           = instances_distribution.value.spot_max_price
        }
      }
      dynamic "launch_template" {
        for_each = mixed_instances_policy.value.launch_template
        content {
          dynamic "launch_template_specification" {
            for_each = launch_template.value.launch_template_specification
            content {
              version              = launch_template_specification.value.version
              launch_template_id   = launch_template_specification.value.launch_template_id
              launch_template_name = launch_template_specification.value.launch_template_name
            }
          }
          dynamic "override" {
            for_each = launch_template.value.override
            content {
              instance_type     = override.value.instance_type == "" ? null : override.value.instance_type
              weighted_capacity = override.value.weighted_capacity == "" ? null : override.value.weighted_capacity
            }
          }
        }

      }
    }
  }
  min_size                         = var.min_size
  max_size                         = var.max_size
  desired_capacity                 = var.desired_capacity
  desired_capacity_type            = var.desired_capacity_type == "" ? null : var.desired_capacity_type
  vpc_zone_identifier              = var.vpc_zone_identifier
  health_check_type                = var.health_check_type
  health_check_grace_period        = var.health_check_grace_period
  capacity_rebalance               = var.capacity_rebalance
  termination_policies             = var.termination_policies
  force_delete                     = var.force_delete == null ? null : var.force_delete
  force_delete_warm_pool           = var.force_delete_warm_pool == null ? null : var.force_delete_warm_pool
  ignore_failed_scaling_activities = var.ignore_failed_scaling_activities
  wait_for_capacity_timeout        = var.wait_for_capacity_timeout == null ? null : var.wait_for_capacity_timeout
  enabled_metrics                  = var.enabled_metrics

  # Attach ASG instances to the Target Group
  target_group_arns = var.target_group_arns

  dynamic "tag" {
    for_each = var.tag
    content {
      key                 = tag.value.key
      propagate_at_launch = tag.value.propagate_at_launch
      value               = tag.value.value
    }
  }
  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      delete = lookup(timeouts.value, "delete", null)
    }
  }

  max_instance_lifetime = var.max_instance_lifetime
}
