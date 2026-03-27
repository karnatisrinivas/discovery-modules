variables {
  name        = "hello"
  description = "hello"
  enabled     = true
  scopes = [
    "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-azure-rg"
  ]
  action = [
    {
      action_group_id    = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-azure-rg/providers/Microsoft.Insights/actionGroups/hello"
      webhook_properties = {}
    }
  ]
  criteria = [
    {
      caller          = "hello"
      category        = "Policy"
      resource_health = []
      service_health  = []

    }
  ]
  tags = null
  timeouts = {
    create = null
    delete = null
    read   = null
    update = null
  }
}

run "test" {
  command = plan
  assert {
    condition     = azurerm_monitor_activity_log_alert.this.name == "hello"
    error_message = "Monitor activity log alert name should be hello"
  }
}
