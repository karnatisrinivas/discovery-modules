variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"

  name      = "test-kv-2007d"
  sku_name  = "standard"
  tenant_id = "6e64fbbf-99a9-464d-a2ee-9d2b511081c9"

  enable_rbac_authorization       = false
  enabled_for_deployment          = null
  enabled_for_disk_encryption     = null
  enabled_for_template_deployment = null
  public_network_access_enabled   = true
  purge_protection_enabled        = false
  soft_delete_retention_days      = null

  tags = {}

}

run "create_keyvault" {
  command = apply
  assert {
    condition     = azurerm_key_vault.this.name == var.name
    error_message = "kevault not found"
  }
}