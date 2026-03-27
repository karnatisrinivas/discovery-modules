variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  create_resource_group = "false"
  location              = "East US"
  resource_group_name   = "example-rg"
  name                  = "laws-test-1"
  retention_in_days     = "30"
  sku                   = "PerGB2018"
}

run "test_apply" {
  command = apply
  assert {
    condition     = azurerm_log_analytics_workspace.this.name == "laws-test-1"
    error_message = "Log Analaytics workspace failed terraform apply"
  }
}
