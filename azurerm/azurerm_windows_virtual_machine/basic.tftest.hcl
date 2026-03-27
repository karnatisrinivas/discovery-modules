variables {
  admin_password        = "testpassword!"
  resource_group_name   = "resourcegroup"
  location              = "westus2"
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  create_resource_group = false
  admin_username        = "adminuser"
  name                  = "my-vm"
  network_interface_ids = ["/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-resource-group/providers/Microsoft.Network/networkInterfaces/networkInterfaceValue"]
  size                  = "Standard_F2"
  os_disk = [
    {
      caching                          = "ReadWrite"
      storage_account_type             = "Standard_LRS"
      diff_disk_settings               = [{ option = "Local", placement = "CacheDisk" }]
      disk_encryption_set_id           = null
      disk_size_gb                     = 128
      name                             = "osdisk1"
      secure_vm_disk_encryption_set_id = null
      security_encryption_type         = null
      write_accelerator_enabled        = false
    }
  ]
  additional_capabilities                                = [{ ultra_ssd_enabled = false, hibernation_enabled = false }]
  additional_unattend_content                            = [{ content = "someContent", setting = "AutoLogon" }]
  allow_extension_operations                             = true
  availability_set_id                                    = null
  boot_diagnostics                                       = [{ storage_account_uri = "https://example.blob.core.windows.net" }]
  bypass_platform_safety_checks_on_user_schedule_enabled = false
  capacity_reservation_group_id                          = null
  computer_name                                          = "my-vm-host"
  custom_date                                            = null
  dedicated_host_id                                      = null
  dedicated_host_group_id                                = null
  edge_zone                                              = null
  disk_controller_type                                   = null
  enable_automatic_updates                               = true
  encryption_at_host_enabled                             = false
  eviction_policy                                        = "Deallocate"
  extensions_time_budget                                 = "PT1H30M"
  gallery_application                                    = []
  hotpatching_enabled                                    = false
  identity                                               = []
  license_type                                           = "Windows_Server"
  max_bid_price                                          = -1
  patch_assessment_mode                                  = "ImageDefault"
  patch_mode                                             = "AutomaticByOS"
  plan                                                   = []
  platform_fault_domain                                  = null
  priority                                               = "Regular"
  provision_vm_agent                                     = true
  proximity_placement_group_id                           = null
  reboot_setting                                         = "IfRequired"
  secret                                                 = []
  secure_boot_enabled                                    = true
  source_image_id                                        = null
  source_image_reference                                 = [{ publisher = "MicrosoftWindowsServer", offer = "WindowsServer", sku = "2019-Datacenter", version = "latest" }]
  tags                                                   = { Environment = "Dev", Project = "VMTest" }
  termination_notification                               = [{ enabled = true, timeout = "PT15M" }]
  timezone                                               = "Pacific Standard Time"
  user_data                                              = null
  virtual_machine_scale_set_id                           = null
  vm_agent_platform_updates_enabled                      = false
  vtpm_enabled                                           = false
  winrm_listener                                         = [{ protocol = "Http", certificate_url = null }]
  zone                                                   = "1"
}

run "test" {
  command = plan
  assert {
    condition     = azurerm_windows_virtual_machine.this.name == "my-vm"
    error_message = "azurerm_windows_virtual_machine did not create"
  }
}