resource "azurerm_monitor_diagnostic_setting" "this" {
  eventhub_authorization_rule_id = var.eventhub_authorization_rule_id
  eventhub_name                  = var.eventhub_name
  log_analytics_destination_type = var.log_analytics_destination_type
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  name                           = var.name
  partner_solution_id            = var.partner_solution_id
  storage_account_id             = var.storage_account_id
  target_resource_id             = var.target_resource_id

  dynamic "enabled_log" {
    for_each = var.enabled_log
    content {
      category       = enabled_log.value.category
      category_group = enabled_log.value.category_group

      dynamic "retention_policy" {
        for_each = enabled_log.value.retention_policy
        content {
          days    = retention_policy.value.days
          enabled = retention_policy.value.enabled
        }
      }

    }
  }

  dynamic "log" {
    for_each = var.log
    content {
      category       = log.value.category
      category_group = log.value.category_group
      enabled        = log.value.enabled

      dynamic "retention_policy" {
        for_each = log.value.retention_policy
        content {
          days    = retention_policy.value.days
          enabled = retention_policy.value.enabled
        }
      }

    }
  }

  dynamic "metric" {
    for_each = var.metric
    content {
      category = metric.value.category
      enabled  = metric.value.enabled

      dynamic "retention_policy" {
        for_each = metric.value.retention_policy
        content {
          days    = retention_policy.value.days
          enabled = retention_policy.value.enabled
        }
      }

    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      read   = lookup(timeouts.value, "read", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
