variables {
  dns_proxy_enabled = false
  dns_servers = [
    "1.1.1.1",
    "1.0.0.1"
  ]
  firewall_policy_id = null
  name               = "hello"
  private_ip_ranges = [
    "10.0.0.0/8",
    "172.16.0.0/12",
    "192.168.0.0/16"
  ]
  sku_name          = "AZFW_Hub"
  sku_tier          = "Basic"
  tags              = null
  threat_intel_mode = null
  zones             = []

  ip_configuration            = []
  management_ip_configuration = []
  virtual_hub                 = []

  timeouts = {
    create = null
    delete = null
    read   = null
    update = null
  }
}

run "test" {
  command = plan
  assert {
    condition     = azurerm_firewall.this.name == "hello"
    error_message = "Firewall name should be hello"
  }
}