resource "azurerm_storage_account_queue_properties" "this" {
  storage_account_id = var.storage_account_id

  dynamic "cors_rule" {
    for_each = var.cors_rule
    content {
      allowed_headers    = cors_rule.value.allowed_headers
      allowed_methods    = cors_rule.value.allowed_methods
      allowed_origins    = cors_rule.value.allowed_origins
      exposed_headers    = cors_rule.value.exposed_headers
      max_age_in_seconds = cors_rule.value.max_age_in_seconds
    }
  }

  dynamic "hour_metrics" {
    for_each = var.hour_metrics
    content {
      include_apis          = hour_metrics.value.include_apis
      retention_policy_days = hour_metrics.value.retention_policy_days
      version               = hour_metrics.value.version
    }
  }

  dynamic "logging" {
    for_each = var.logging
    content {
      delete                = logging.value.delete
      read                  = logging.value.read
      retention_policy_days = logging.value.retention_policy_days
      version               = logging.value.version
      write                 = logging.value.write
    }
  }

  dynamic "minute_metrics" {
    for_each = var.minute_metrics
    content {
      include_apis          = minute_metrics.value.include_apis
      retention_policy_days = minute_metrics.value.retention_policy_days
      version               = minute_metrics.value.version
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
