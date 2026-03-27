variables {
  create_resource_group = true
  location              = "East US"
  resource_group_name   = "eventgrid-rg"

  eventgrid_topic_name = "test-topic"

  tags = {
    environment = "test"
  }
}


run "validate" {
  command = apply
  assert {
    condition     = azurerm_eventgrid_topic.this.name == "test-topic"
    error_message = "Azure Eventgrid Topic name is not correct"
  }
}