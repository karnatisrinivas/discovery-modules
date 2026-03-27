variables {
  name                  = "test"
  location              = "westus2"
  resource_group_name   = "example-azure-rg"
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  create_resource_group = false
  namespace_type        = "NotificationHub"
  sku_name              = "Basic"
  enabled               = true
  tags = {
    environment = "test"
  }
  timeouts = {
    create = "10m"
    delete = "10m"
    read   = "10m"
    update = "10m"
  }
}

run "test" {
  command = plan
  assert {
    condition     = azurerm_notification_hub_namespace.this.name == "test"
    error_message = "The name of the notification hub namespace should be test"
  }
}