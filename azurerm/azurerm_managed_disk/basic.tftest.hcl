variables {
  # Required inputs - must be provided by user
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  create_resource_group = false
  location              = "East US"
  resource_group_name   = "example-rg"

  name                              = "disk"
  storage_account_type              = "UltraSSD_LRS"
  create_option                     = "Import"
  disk_encryption_set_id            = null
  disk_iops_read_write              = 1
  disk_mbps_read_write              = 1
  disk_iops_read_only               = 1
  disk_mbps_read_only               = 1
  upload_size_bytes                 = 1
  disk_size_gb                      = 1
  edge_zone                         = 1
  hyper_v_generation                = "V1"
  image_reference_id                = null
  gallery_image_reference_id        = null
  logical_sector_size               = "4096"
  optimized_frequent_attach_enabled = true
  performance_plus_enabled          = true
  os_type                           = "Windows"
  source_resource_id                = "source"
  source_uri                        = "source"
  storage_account_id                = null
  tier                              = "P1"
  max_shares                        = 2
  trusted_launch_enabled            = true
  security_type                     = "ConfidentialVM_VMGuestStateOnlyEncryptedWithPlatformKey"
  secure_vm_disk_encryption_set_id  = null
  on_demand_bursting_enabled        = true
  tags                              = null
  zone                              = "LON1"
  network_access_policy             = "AllowPrivate"
  disk_access_id                    = "disk_access"
  public_network_access_enabled     = false
  encryption_settings = [
    {
      disk_encryption_key = {
        secret_url      = "asd"
        source_vault_id = "asd"
      }

      key_encryption_key = {
        key_url         = "keyurl"
        source_vault_id = "sourcevault"
      }
    }
  ]
}

run "test" {
  command = plan
  assert {
    condition     = azurerm_managed_disk.this.name == "disk"
    error_message = "azurerm_managed_disk did not create"
  }
}