variables {
  location                                                              = "eastus"
  name                                                                  = "gahagatestsub"
  resource_group_name                                                   = "defaultresourcegroup-eus"
  auto_delete_on_idle                                                   = null
  tags                                                                  = { "hehe" : "haha" }
  client_id                                                             = null
  default_message_ttl                                                   = null
  topic_id                                                              = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-resource-group/providers/Microsoft.ServiceBus/namespaces/namespaceValue/topics/gahagatest"
  forward_to                                                            = null
  validate_azurerm_servicebus_namespace_will_be_created_if_not_provided = null
  is_client_scoped_subscription_durable                                 = null
}

run "validate_azurerm_servicebus_namespace_will_be_created_if_not_provided" {
  command = plan
  assert {
    condition     = azurerm_servicebus_subscription.this.name == "gahagatestsub"
    error_message = "Expected at least one azurerm_servicebus_namespace resource to be created, but none were found."
  }
}
