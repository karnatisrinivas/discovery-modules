resource "azurerm_managed_disk" "this" {
  name                              = var.name
  storage_account_type              = var.storage_account_type
  location                          = var.location
  resource_group_name               = var.resource_group_name
  create_option                     = var.create_option
  disk_encryption_set_id            = var.disk_encryption_set_id == "" ? null : var.disk_encryption_set_id
  disk_iops_read_write              = var.disk_iops_read_write
  disk_mbps_read_write              = var.disk_mbps_read_write
  disk_iops_read_only               = var.disk_iops_read_only == 0 ? null : var.disk_iops_read_only
  disk_mbps_read_only               = var.disk_mbps_read_only == 0 ? null : var.disk_mbps_read_only
  upload_size_bytes                 = var.upload_size_bytes == 0 ? null : var.upload_size_bytes
  disk_size_gb                      = var.disk_size_gb
  edge_zone                         = var.edge_zone == "" ? null : var.edge_zone
  hyper_v_generation                = var.hyper_v_generation == "" ? null : (var.create_option == "ImportSecure" ? "V2" : var.hyper_v_generation)
  image_reference_id                = var.image_reference_id == "" ? null : var.image_reference_id
  gallery_image_reference_id        = var.gallery_image_reference_id == "" ? null : var.gallery_image_reference_id
  logical_sector_size               = tonumber(var.logical_sector_size)
  optimized_frequent_attach_enabled = var.optimized_frequent_attach_enabled
  performance_plus_enabled          = var.performance_plus_enabled
  os_type                           = var.os_type == "" ? null : var.os_type
  source_resource_id                = var.source_resource_id
  source_uri                        = var.source_uri
  storage_account_id                = var.storage_account_id == "" ? null : var.storage_account_id
  tier                              = var.tier
  max_shares                        = var.max_shares == 0 ? null : var.max_shares
  trusted_launch_enabled            = var.trusted_launch_enabled
  security_type                     = var.security_type == "" ? null : var.security_type
  secure_vm_disk_encryption_set_id  = var.secure_vm_disk_encryption_set_id == "" ? null : var.secure_vm_disk_encryption_set_id
  on_demand_bursting_enabled        = var.on_demand_bursting_enabled
  tags                              = var.tags
  zone                              = var.zone
  network_access_policy             = var.network_access_policy
  public_network_access_enabled     = var.public_network_access_enabled
  disk_access_id                    = var.disk_access_id == "" ? null : var.disk_access_id

  dynamic "encryption_settings" {
    for_each = var.encryption_settings
    content {
      disk_encryption_key {
        secret_url      = encryption_settings.value.disk_encryption_key.secret_url
        source_vault_id = encryption_settings.value.disk_encryption_key.source_vault_id
      }

      key_encryption_key {
        key_url         = encryption_settings.value.key_encryption_key.key_url
        source_vault_id = encryption_settings.value.key_encryption_key.source_vault_id
      }
    }
  }
}