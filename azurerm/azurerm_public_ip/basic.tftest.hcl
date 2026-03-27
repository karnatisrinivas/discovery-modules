variables {
  # Resource group name (modify if needed)
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"

  # Public IP name (modify if needed)
  name = "my-public-ip-test"

  # Allocation method (modify if needed)
  allocation_method = "Static"

  # Optional arguments (set values if needed)
  ddos_protection_mode    = null
  ddos_protection_plan_id = null
  domain_name_label       = null
  edge_zone               = null
  idle_timeout_in_minutes = null
  ip_tags                 = null
  ip_version              = "IPv4" # default
  public_ip_prefix_id     = null
  reverse_fqdn            = null
  sku                     = null
  sku_tier                = null
  tags                    = null
  zones                   = null

}

run "basic" {
  command = apply
  assert {
    condition     = azurerm_public_ip.this.name == var.name
    error_message = "failed to execute terraform plan for azure public ip"
  }
}