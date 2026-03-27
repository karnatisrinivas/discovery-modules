resource "azurerm_redis_cache" "this" {
  capacity            = var.capacity
  family              = var.family
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name

  non_ssl_port_enabled          = var.non_ssl_port_enabled
  minimum_tls_version           = var.minimum_tls_version
  public_network_access_enabled = var.public_network_access_enabled
  shard_count                   = var.shard_count
  subnet_id                     = var.subnet_id
  tags                          = var.tags
  tenant_settings               = var.tenant_settings
  zones                         = var.zones
}
