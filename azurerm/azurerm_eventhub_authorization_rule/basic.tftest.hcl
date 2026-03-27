variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  create_resource_group = false
  location              = "East US"
  eventhub_name         = "eventhub"
  listen                = false
  manage                = false
  name                  = "authrule"
  namespace_name        = "namespace"
  resource_group_name   = "resourcegroup"
  send                  = true
}
run "test" {
  command = plan
  assert {
    condition     = azurerm_eventhub_authorization_rule.this.name != null
    error_message = "azurerm_eventhub_authorization_rule was not succesful"
  }
}
