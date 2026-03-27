variables {

  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"


  end_ip           = "0.0.0.0"
  name             = "examplefirewallrule"
  redis_cache_name = "example-redis-cache"
  start_ip         = "0.0.0.0"
}

run "create_redis_firewall_rule" {
  command = apply

  assert {
    condition     = azurerm_redis_firewall_rule.this.name == var.name
    error_message = "Redis Firewall Rule name does not match the expected value"
  }

  assert {
    condition     = azurerm_redis_firewall_rule.this.redis_cache_name == var.redis_cache_name
    error_message = "Redis Firewall Rule cache name does not match the expected value"
  }

}