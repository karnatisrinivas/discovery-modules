data "azurerm_redis_cache" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
}
