
resource "azurerm_eventgrid_topic" "this" {
  name                = var.eventgrid_topic_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

