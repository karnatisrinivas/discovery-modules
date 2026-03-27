resource "azurerm_cosmosdb_account" "this" {
  location            = var.location
  name                = var.name
  offer_type          = var.offer_type
  resource_group_name = var.resource_group_name

  dynamic "geo_location" {
    for_each = var.geo_location
    content {
      failover_priority = geo_location.value.failover_priority
      location          = geo_location.value.location
    }
  }

  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = var.max_interval_in_seconds
  }

  access_key_metadata_writes_enabled    = var.access_key_metadata_writes_enabled
  analytical_storage_enabled            = var.analytical_storage_enabled
  burst_capacity_enabled                = var.burst_capacity_enabled
  default_identity_type                 = var.default_identity_type
  ip_range_filter                       = var.ip_range_filter
  is_virtual_network_filter_enabled     = var.is_virtual_network_filter_enabled
  key_vault_key_id                      = var.key_vault_key_id
  kind                                  = var.kind
  local_authentication_disabled         = var.local_authentication_disabled
  network_acl_bypass_for_azure_services = var.network_acl_bypass_for_azure_services
  network_acl_bypass_ids                = var.network_acl_bypass_ids
  partition_merge_enabled               = var.partition_merge_enabled
  public_network_access_enabled         = var.public_network_access_enabled
  tags                                  = var.tags
}
