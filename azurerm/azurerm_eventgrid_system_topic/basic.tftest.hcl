variables {
  create_resource_group       = true
  location                    = "East US"
  resource_group_name         = "myResourceGroup"
  eventgrid_system_topic_name = "myEventGridSystemTopic"
  source_arm_resource_id      = "/subscriptions/id/resourceGroups/myResourceGroup"
  eventgrid_topic_type        = "Microsoft.Resources.ResourceGroups" // list of supported topic_types: az eventgrid topic-type list --output json | grep -w id
}

run "validate" {
  command = plan

  assert {
    condition     = azurerm_eventgrid_system_topic.this.name == "myEventGridSystemTopic"
    error_message = "Expected the EventGrid System Topic to have the name 'myEventGridSystemTopic'"
  }


}

// Known bug: https://stackoverflow.com/questions/70880703/creation-of-system-topic-failed-while-creating-event-subscription-in-azure-maps