resource "azurerm_monitor_activity_log_alert" "this" {
  description         = var.description
  enabled             = var.enabled
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  scopes              = var.scopes
  tags                = var.tags

  dynamic "action" {
    for_each = var.action
    content {
      action_group_id    = action.value.action_group_id
      webhook_properties = action.value.webhook_properties
    }
  }

  dynamic "criteria" {
    for_each = var.criteria
    content {
      caller                  = criteria.value.caller
      category                = criteria.value.category
      level                   = criteria.value.level
      levels                  = criteria.value.levels
      operation_name          = criteria.value.operation_name
      recommendation_category = criteria.value.recommendation_category
      recommendation_impact   = criteria.value.recommendation_impact
      recommendation_type     = criteria.value.recommendation_type
      resource_group          = criteria.value.resource_group
      resource_groups         = criteria.value.resource_groups
      resource_id             = criteria.value.resource_id
      resource_ids            = criteria.value.resource_ids
      resource_provider       = criteria.value.resource_provider
      resource_providers      = criteria.value.resource_providers
      resource_type           = criteria.value.resource_type
      resource_types          = criteria.value.resource_types
      status                  = criteria.value.status
      statuses                = criteria.value.statuses
      sub_status              = criteria.value.sub_status
      sub_statuses            = criteria.value.sub_statuses

      dynamic "resource_health" {
        for_each = criteria.value.resource_health
        content {
          current  = resource_health.value.current
          previous = resource_health.value.previous
          reason   = resource_health.value.reason
        }
      }

      dynamic "service_health" {
        for_each = criteria.value.service_health
        content {
          events    = service_health.value.events
          locations = service_health.value.locations
          services  = service_health.value.services
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
