variables {

  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"

  name = "example-redis-cache"
}

run "get_redis" {
  command = apply

  assert {
    condition     = data.azurerm_redis_cache.this.name == var.name
    error_message = "Redis name does not match the expected value"
  }

}