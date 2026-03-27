variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"
  name                  = "example-eventhub"
  namespace_name        = "example-eventhub-namespace"
}

run "create_eventhub_namespace" {
  command = apply

  assert {
    condition     = data.azurerm_eventhub.this.name == var.name
    error_message = "Event Hub Namespace name does not match the expected value"
  }
}