variables {
  name                  = "test"
  notification_hub_name = "test"
  namespace_name        = "test"
  manage                = true
  send                  = true
  listen                = true
  timeouts = {
    create = "10m"
    delete = "10m"
    read   = "10m"
    update = "10m"
  }
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  resource_group_name   = "example-azure-rg"
  location              = "us-west-2"
  create_resource_group = false
}

run "test" {
  command = plan
  assert {
    condition     = azurerm_notification_hub_authorization_rule.this.name == "test"
    error_message = "The name of the notification hub authorization rule should be test"
  }
}

