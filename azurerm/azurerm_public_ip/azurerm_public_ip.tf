resource "azurerm_public_ip" "this" {
  allocation_method   = var.allocation_method
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name

  ddos_protection_mode    = var.ddos_protection_mode
  ddos_protection_plan_id = var.ddos_protection_plan_id
  domain_name_label       = var.domain_name_label
  edge_zone               = var.edge_zone != "" ? var.edge_zone : null
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  ip_tags                 = var.ip_tags
  ip_version              = var.ip_version
  public_ip_prefix_id     = var.public_ip_prefix_id
  reverse_fqdn            = var.reverse_fqdn
  sku                     = var.sku
  sku_tier                = var.sku_tier
  tags                    = var.tags
  zones                   = var.zones
}
