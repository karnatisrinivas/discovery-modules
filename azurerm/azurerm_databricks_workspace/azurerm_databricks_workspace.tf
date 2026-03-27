resource "azurerm_databricks_workspace" "this" {
  location                    = var.location
  name                        = var.name
  resource_group_name         = var.resource_group_name
  sku                         = var.sku
  managed_resource_group_name = var.managed_resource_group_name

  access_connector_id                                 = var.access_connector_id
  customer_managed_key_enabled                        = var.customer_managed_key_enabled
  default_storage_firewall_enabled                    = var.default_storage_firewall_enabled
  infrastructure_encryption_enabled                   = var.infrastructure_encryption_enabled
  load_balancer_backend_address_pool_id               = var.load_balancer_backend_address_pool_id
  managed_disk_cmk_key_vault_id                       = var.managed_disk_cmk_key_vault_id
  managed_disk_cmk_key_vault_key_id                   = var.managed_disk_cmk_key_vault_key_id
  managed_disk_cmk_rotation_to_latest_version_enabled = var.managed_disk_cmk_rotation_to_latest_version_enabled
  managed_services_cmk_key_vault_id                   = var.managed_services_cmk_key_vault_id
  managed_services_cmk_key_vault_key_id               = var.managed_services_cmk_key_vault_key_id
  public_network_access_enabled                       = var.public_network_access_enabled
  tags                                                = var.tags

  custom_parameters {
    no_public_ip                                         = var.no_public_ip
    virtual_network_id                                   = var.virtual_network_id
    private_subnet_name                                  = var.private_subnet_name
    public_subnet_name                                   = var.public_subnet_name
    private_subnet_network_security_group_association_id = var.private_subnet_network_security_group_association_id
    public_subnet_network_security_group_association_id  = var.public_subnet_network_security_group_association_id
  }
}
