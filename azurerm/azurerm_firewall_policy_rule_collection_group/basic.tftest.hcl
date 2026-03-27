variables {
  name               = "hello"
  priority           = 100
  firewall_policy_id = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-azure-rg/providers/Microsoft.Network/firewallPolicies/hello"
  timeouts = {
    create = null
    delete = null
    read   = null
    update = null
  }
  application_rule_collection = []
  nat_rule_collection         = []
  network_rule_collection     = []
  rule_collection_groups      = []
}

run "test" {
  command = plan
  assert {
    condition     = azurerm_firewall_policy_rule_collection_group.this.name == "hello"
    error_message = "Firewall policy rule collection group name should be hello"
  }
}