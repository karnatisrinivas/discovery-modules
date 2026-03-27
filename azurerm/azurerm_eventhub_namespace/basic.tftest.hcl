variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"
  name                  = "example-eventhub-namespace"
  sku                   = "Standard"

  auto_inflate_enabled          = false
  capacity                      = 1
  dedicated_cluster_id          = null
  local_authentication_enabled  = true
  maximum_throughput_units      = null
  public_network_access_enabled = true

  tags = {
    environment = "test"
  }
}

run "create_eventhub_namespace" {
  command = apply

  assert {
    condition     = azurerm_eventhub_namespace.this.name == var.name
    error_message = "Event Hub Namespace name does not match the expected value"
  }
}