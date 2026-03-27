variables {
  # Required inputs - must be provided by user
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  create_resource_group = false
  location              = "East US"
  resource_group_name   = "example-rg"
  name                  = "test-action-group-1"
  short_name            = "group1" # Must be 1-12 characters long

  # Optional parameters with default values
  enabled = true
  # location  = "global"  # Action Groups are global resources
  tags = {}

  # Webhook receiver configuration - example structure
  webhook_receiver = []

  # Email receiver configuration - example structure
  email_receiver = [
    {
      name          = "example-email"
      email_address = "alerts@example.com" # Must be provided by user
    }
  ]

  # SMS receiver configuration - example structure
  sms_receiver = []
}

run "test_apply" {
  command = plan
  assert {
    condition     = azurerm_monitor_action_group.this.name == var.name
    error_message = "Azure Monitor Action Group failed terraform plan"
  }
}
