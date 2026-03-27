resource "google_compute_instance_group_manager" "this" {
  base_instance_name             = var.base_instance_name
  description                    = var.description
  list_managed_instances_results = var.list_managed_instances_results
  name                           = var.name
  target_pools                   = var.target_pools
  target_size                    = var.target_size
  target_stopped_size            = var.target_stopped_size
  target_suspended_size          = var.target_suspended_size
  wait_for_instances             = var.wait_for_instances
  wait_for_instances_status      = var.wait_for_instances_status
  zone                           = var.zone

  dynamic "all_instances_config" {
    for_each = var.all_instances_config
    content {
      labels   = all_instances_config.value.labels
      metadata = all_instances_config.value.metadata
    }
  }

  dynamic "auto_healing_policies" {
    for_each = var.auto_healing_policies
    content {
      health_check      = auto_healing_policies.value.health_check
      initial_delay_sec = auto_healing_policies.value.initial_delay_sec
    }
  }

  dynamic "instance_lifecycle_policy" {
    for_each = var.instance_lifecycle_policy
    content {
      default_action_on_failure = instance_lifecycle_policy.value.default_action_on_failure
      force_update_on_repair    = instance_lifecycle_policy.value.force_update_on_repair
    }
  }

  dynamic "named_port" {
    for_each = var.named_port
    content {
      name = named_port.value.name
      port = named_port.value.port
    }
  }

  dynamic "standby_policy" {
    for_each = var.standby_policy
    content {
      initial_delay_sec = standby_policy.value.initial_delay_sec
      mode              = standby_policy.value.mode
    }
  }

  dynamic "stateful_disk" {
    for_each = var.stateful_disk
    content {
      delete_rule = stateful_disk.value.delete_rule
      device_name = stateful_disk.value.device_name
    }
  }

  dynamic "stateful_external_ip" {
    for_each = var.stateful_external_ip
    content {
      delete_rule    = stateful_external_ip.value.delete_rule
      interface_name = stateful_external_ip.value.interface_name
    }
  }

  dynamic "stateful_internal_ip" {
    for_each = var.stateful_internal_ip
    content {
      delete_rule    = stateful_internal_ip.value.delete_rule
      interface_name = stateful_internal_ip.value.interface_name
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

  dynamic "update_policy" {
    for_each = var.update_policy
    content {
      max_surge_fixed                = update_policy.value.max_surge_fixed
      max_surge_percent              = update_policy.value.max_surge_percent
      max_unavailable_fixed          = update_policy.value.max_unavailable_fixed
      max_unavailable_percent        = update_policy.value.max_unavailable_percent
      minimal_action                 = update_policy.value.minimal_action
      most_disruptive_allowed_action = update_policy.value.most_disruptive_allowed_action
      replacement_method             = update_policy.value.replacement_method
      type                           = update_policy.value.type
    }
  }

  dynamic "version" {
    for_each = var.template_version
    content {
      instance_template = version.value.instance_template
      name              = version.value.name

      dynamic "target_size" {
        for_each = version.value.target_size
        content {
          fixed   = target_size.value.fixed
          percent = target_size.value.percent
        }
      }

    }
  }

}
