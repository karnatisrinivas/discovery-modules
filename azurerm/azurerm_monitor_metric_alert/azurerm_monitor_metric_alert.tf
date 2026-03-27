resource "azurerm_monitor_metric_alert" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  scopes              = var.scopes

  dynamic "criteria" {
    for_each = var.criteria
    content {
      metric_name      = criteria.value.metric_name
      metric_namespace = criteria.value.metric_namespace
      operator         = criteria.value.operator
      threshold        = criteria.value.threshold
      aggregation      = criteria.value.aggregation
    }
  }

  action {
    action_group_id = var.action_group_id
  }

  auto_mitigate = var.auto_mitigate
  description   = var.description
  enabled       = var.enabled
  frequency     = var.frequency
  severity      = var.severity
  tags          = var.tags
  window_size   = var.window_size
}
