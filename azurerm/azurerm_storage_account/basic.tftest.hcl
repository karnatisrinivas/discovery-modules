variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "eastus"
  resource_group_name   = "example-rg"
  create_resource_group = false


  account_replication_type = "LRS"
  account_tier             = "Standard"

  name = "4fafae20storage"

  account_kind                      = "StorageV2"
  allow_nested_items_to_be_public   = null
  allowed_copy_scope                = null
  cross_tenant_replication_enabled  = null
  default_to_oauth_authentication   = null
  dns_endpoint_type                 = null
  edge_zone                         = null
  infrastructure_encryption_enabled = null
  is_hns_enabled                    = null
  local_user_enabled                = null
  min_tls_version                   = null
  nfsv3_enabled                     = null
  public_network_access_enabled     = null
  queue_encryption_key_type         = null
  sftp_enabled                      = null
  shared_access_key_enabled         = null
  table_encryption_key_type         = null
  tags                              = {}
}


run "validate" {
  command = apply
  assert {
    condition     = azurerm_storage_account.this.name == var.name
    error_message = "Azure storage account name is not correct"
  }

}
