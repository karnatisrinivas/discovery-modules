resource "azurerm_eventhub_namespace" "this" {
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  sku                 = var.sku

  auto_inflate_enabled          = var.auto_inflate_enabled
  capacity                      = var.capacity
  dedicated_cluster_id          = var.dedicated_cluster_id
  local_authentication_enabled  = var.local_authentication_enabled
  maximum_throughput_units      = var.maximum_throughput_units
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.tags
}
