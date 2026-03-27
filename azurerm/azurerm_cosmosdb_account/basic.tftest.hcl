variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"
  name                  = "example-cosmosdb-account"
  offer_type            = "Standard"

  geo_location = [
    {
      location          = "eastus"
      failover_priority = 0
    },
    {
      location          = "westus"
      failover_priority = 1
    }
  ]

  consistency_level                     = "Session"
  max_interval_in_seconds               = 5
  access_key_metadata_writes_enabled    = true
  analytical_storage_enabled            = false
  burst_capacity_enabled                = false
  default_identity_type                 = "FirstPartyIdentity"
  ip_range_filter                       = "1.2.3.4/32"
  is_virtual_network_filter_enabled     = false
  key_vault_key_id                      = null
  kind                                  = "GlobalDocumentDB"
  local_authentication_disabled         = false
  network_acl_bypass_for_azure_services = false
  network_acl_bypass_ids                = []
  partition_merge_enabled               = false
  public_network_access_enabled         = true
  tags = {
    environment = "test"
  }
}

run "create_cosmosdb_account" {
  command = plan

  assert {
    condition     = azurerm_cosmosdb_account.this.name == var.name
    error_message = "Cosmos DB Account name does not match the expected value"
  }

  assert {
    condition     = azurerm_cosmosdb_account.this.offer_type == var.offer_type
    error_message = "Cosmos DB Account offer type does not match the expected value"
  }
}