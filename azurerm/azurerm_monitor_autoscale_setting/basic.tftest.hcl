variables {
  # Required variables - user should provide these
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"
  name                  = "example-autoscale-setting"

  tags = {
    environment = "production"
    department  = "engineering"
  }

  target_resource_id = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg/providers/Microsoft.Compute/virtualMachineScaleSets/testvmss"

  # Capacity settings
  capacity_default = 2
  capacity_minimum = 1
  capacity_maximum = 10

  # Predictive scaling settings
  scale_mode      = "Enabled"
  look_ahead_time = "PT5M"

  # Notification settings
  email_ids_for_notifications = [
    "devops@example.com",
    "alerts@example.com"
  ]

  rules = [
    {
      metric_name               = "Percentage CPU"
      metric_resource_id        = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg/providers/Microsoft.Compute/virtualMachineScaleSets/testvmss"
      metric_namespace          = "Microsoft.Compute/virtualMachineScaleSets"
      time_grain                = "PT1M"
      statistic                 = "Average"
      time_window               = "PT5M"
      time_aggregation          = "Average"
      operator                  = "GreaterThan"
      threshold                 = 75
      metric_dimension_name     = "AppName"
      metric_dimension_operator = "Equals"
      metric_dimension_values   = ["MyApp"]
      scale_action_direction    = "Increase"
      scale_action_type         = "ChangeCount"
      scale_action_value        = 1
      scale_action_cooldown     = "PT5M"
    },
    {
      metric_name               = "Percentage CPU"
      metric_resource_id        = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg/providers/Microsoft.Compute/virtualMachineScaleSets/testvmss"
      metric_namespace          = "Microsoft.Compute/virtualMachineScaleSets"
      time_grain                = "PT1M"
      statistic                 = "Average"
      time_window               = "PT5M"
      time_aggregation          = "Average"
      operator                  = "LessThan"
      threshold                 = 25
      metric_dimension_name     = "" # Changed from null to empty string
      metric_dimension_operator = "" # Changed from null to empty string
      metric_dimension_values   = "" # Changed from null to empty string
      scale_action_direction    = "Decrease"
      scale_action_type         = "ChangeCount"
      scale_action_value        = 1
      scale_action_cooldown     = "PT5M"
    }
  ]
}

run "create_azurerm_monitor_autoscale_setting" {
  command = apply

  assert {
    condition     = azurerm_monitor_autoscale_setting.this.name == var.name
    error_message = "Autoscale setting was applied successfully."
  }
}