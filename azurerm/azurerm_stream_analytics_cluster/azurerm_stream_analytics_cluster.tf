resource "azurerm_stream_analytics_cluster" "this" {
  location            = var.location
  name                = var.stream_analytics_cluster_name
  resource_group_name = var.resource_group_name
  streaming_capacity  = var.stream_capacity
}

