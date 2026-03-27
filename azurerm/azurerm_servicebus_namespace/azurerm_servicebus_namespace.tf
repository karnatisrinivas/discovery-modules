locals {
  #   validate_capacity = var.sku != "premium" && var.capacity != 0 ? error("Capacity must be 0 if sku is not premium.") : true
  capacity                     = var.sku == "Premium" && var.capacity == 0 ? 1 : var.capacity
  premium_messaging_partitions = var.sku == "Premium" && var.premium_messaging_partitions == 0 ? 1 : var.premium_messaging_partitions
}

resource "azurerm_servicebus_namespace" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  // capacity can only be set when sku is premium, default to 0 for basic and standard
  capacity = var.sku != "Premium" ? 0 : local.capacity
  // this is done to ensure that the minimum number of partitions is set to 1 (minimum value) or higher when sku is premium
  premium_messaging_partitions  = var.sku != "Premium" ? 0 : local.premium_messaging_partitions
  local_auth_enabled            = var.local_auth_enabled
  public_network_access_enabled = var.public_network_access_enabled
  minimum_tls_version           = var.minimum_tls_version
  zone_redundant                = var.zone_redundant
  tags                          = var.tags
  identity {
    type         = length(var.user_managed_identities) > 0 ? "SystemAssigned, UserAssigned" : "SystemAssigned"
    identity_ids = length(var.user_managed_identities) > 0 ? var.user_managed_identities : null
  }
  dynamic "customer_managed_key" {
    for_each = var.key_vault_key_id != "" ? [1] : []
    content {
      key_vault_key_id = var.key_vault_key_id
      identity_id      = var.identity_id
    }
  }
  dynamic "network_rule_set" {
    for_each = var.network_rule_set_default_action != "Deny" ? [1] : []
    content {
      default_action           = var.network_rule_set_default_action
      trusted_services_allowed = var.trusted_services_allowed
      ip_rules                 = var.ip_rules
      dynamic "network_rules" {
        for_each = var.allowed_subnet_ids
        content {
          subnet_id                            = network_rules.value
          ignore_missing_vnet_service_endpoint = true
        }
      }
    }
  }
}
