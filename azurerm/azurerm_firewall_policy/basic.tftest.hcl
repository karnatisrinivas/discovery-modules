variables {
  name                              = "hello"
  auto_learn_private_ranges_enabled = false
  base_policy_id                    = null
  private_ip_ranges = [
    "10.0.0.0/8",
    "172.16.0.0/12",
    "192.168.0.0/16"
  ]
  sku                      = "Basic"
  sql_redirect_allowed     = false
  tags                     = null
  threat_intelligence_mode = "Alert"
  timeouts = {
    create = null
    delete = null
    read   = null
    update = null
  }
  dns                           = []
  explicit_proxy                = []
  identity                      = []
  insights                      = []
  intrusion_detection           = []
  threat_intelligence_allowlist = []
  tls_certificate               = []
  rule_collection_groups        = []
}

run "test" {
  command = plan
  assert {
    condition     = azurerm_firewall_policy.this.name == "hello"
    error_message = "Firewall policy name should be hello"
  }
}