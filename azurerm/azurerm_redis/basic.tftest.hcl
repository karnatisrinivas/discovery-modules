variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"

  capacity = 1
  family   = "C"
  name     = "example-redis-cache"
  sku_name = "Basic"

  non_ssl_port_enabled          = false
  minimum_tls_version           = "1.2"
  public_network_access_enabled = true
  shard_count                   = null
  subnet_id                     = null
  tags = {
    environment = "test"
  }
  tenant_settings = null
  zones           = null
}

run "create_redis_cache" {
  command = plan

  assert {
    condition     = azurerm_redis_cache.this.capacity == var.capacity
    error_message = "Redis Cache capacity does not match the expected value"
  }

  assert {
    condition     = azurerm_redis_cache.this.family == var.family
    error_message = "Redis Cache family does not match the expected value"
  }

  assert {
    condition     = azurerm_redis_cache.this.name == var.name
    error_message = "Redis Cache name does not match the expected value"
  }
}