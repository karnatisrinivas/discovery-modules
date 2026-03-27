variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  create_resource_group = false
  location              = "East US"
  resource_group_name   = "example-rg"


  # Required inputs - must be provided by user
  name   = "test-metric-alert-1"
  scopes = ["/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg-secondary/providers/Microsoft.Storage/storageAccounts/examplestoragelogs"]

  # Criteria block - example structure
  criteria = [
    {
      metric_name      = "Transactions"
      metric_namespace = "Microsoft.Storage/storageAccounts"
      operator         = "GreaterThan"
      threshold        = 80
      aggregation      = "Total"
    }
  ]

  # Action block
  action_group_id = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg/providers/Microsoft.Insights/actionGroups/test-action-group-1"

  # Optional inputs with default values
  auto_mitigate = true
  description   = null
  enabled       = true
  frequency     = "PT5M" # 5 minutes
  severity      = 3
  tags          = {}
  window_size   = "PT5M" # 5 minutes
}


run "test_apply" {
  command = plan
  assert {
    condition     = azurerm_monitor_metric_alert.this.name == var.name
    error_message = "Azure Monitor Metric Alert failed terraform plan"
  }
}
