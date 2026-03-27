variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  create_resource_group = "false"
  location              = "East US"
  resource_group_name   = "example-rg"
  name                  = "not-hub-test"
  namespace_name        = "asdasdasd"
  namespace_type        = "NotificationHub"
  sku_name              = "Free"
  apns_credential       = []
  gcm_credential        = []
  timeouts              = null
  tags                  = null
}

run "test" {
  command = plan
  assert {
    condition     = azurerm_notification_hub.this.name == "not-hub-test"
    error_message = "Notification Hub test did not pass."
  }
}