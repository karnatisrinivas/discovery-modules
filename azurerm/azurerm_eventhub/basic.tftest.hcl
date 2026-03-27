variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"
  message_retention     = 1
  name                  = "example-eventhub"
  namespace_name        = "example-eventhub-namespace"
  partition_count       = 2

  status = "Active"
}

run "create_eventhub" {
  command = apply
  assert {
    condition     = azurerm_eventhub.this.name == var.name
    error_message = "Event Hub name does not match the expected value"
  }
}