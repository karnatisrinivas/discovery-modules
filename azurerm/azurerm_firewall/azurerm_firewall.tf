resource "azurerm_firewall" "this" {
  dns_proxy_enabled   = var.dns_proxy_enabled
  dns_servers         = var.dns_servers
  firewall_policy_id  = var.firewall_policy_id
  location            = var.location
  name                = var.name
  private_ip_ranges   = var.private_ip_ranges
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  sku_tier            = var.sku_tier
  tags                = var.tags
  threat_intel_mode   = var.threat_intel_mode
  zones               = var.zones

  dynamic "ip_configuration" {
    for_each = var.ip_configuration
    content {
      name                 = ip_configuration.value.name
      public_ip_address_id = ip_configuration.value.public_ip_address_id
      subnet_id            = ip_configuration.value.subnet_id
    }
  }

  dynamic "management_ip_configuration" {
    for_each = var.management_ip_configuration
    content {
      name                 = management_ip_configuration.value.name
      public_ip_address_id = management_ip_configuration.value.public_ip_address_id
      subnet_id            = management_ip_configuration.value.subnet_id
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      read   = lookup(timeouts.value, "read", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

  dynamic "virtual_hub" {
    for_each = var.virtual_hub
    content {
      public_ip_count = virtual_hub.value.public_ip_count
      virtual_hub_id  = virtual_hub.value.virtual_hub_id
    }
  }

}
