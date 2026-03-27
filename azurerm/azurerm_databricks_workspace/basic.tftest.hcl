variables {
  subscription_id             = "12345678-1234-9876-4563-123456789012"
  location                    = "East US"
  resource_group_name         = "example-rg"
  create_resource_group       = "false"
  name                        = "example-databricks-workspace"
  sku                         = "standard"
  managed_resource_group_name = "mrgn"

  access_connector_id                                 = null
  customer_managed_key_enabled                        = false
  default_storage_firewall_enabled                    = null
  infrastructure_encryption_enabled                   = false
  load_balancer_backend_address_pool_id               = null
  managed_disk_cmk_key_vault_id                       = null
  managed_disk_cmk_key_vault_key_id                   = null
  managed_disk_cmk_rotation_to_latest_version_enabled = null
  managed_services_cmk_key_vault_id                   = null
  managed_services_cmk_key_vault_key_id               = null
  public_network_access_enabled                       = true

  no_public_ip                                         = true
  virtual_network_id                                   = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg/providers/Microsoft.Network/virtualNetworks/example-vnet"
  private_subnet_name                                  = "default"
  public_subnet_name                                   = "default2"
  private_subnet_network_security_group_association_id = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg/providers/Microsoft.Network/networkSecurityGroups/nsg1"
  public_subnet_network_security_group_association_id  = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg/providers/Microsoft.Network/networkSecurityGroups/nsg2"

  tags = {
    environment = "test"
  }
}

run "create_databricks_workspace" {
  command = apply

  assert {
    condition     = azurerm_databricks_workspace.this.name == var.name
    error_message = "Databricks workspace name does not match the expected value"
  }
}