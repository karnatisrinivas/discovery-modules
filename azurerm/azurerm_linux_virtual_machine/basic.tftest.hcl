variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "test-vm"
  create_resource_group = "false"

  admin_username = "adminuser"
  admin_password = "SecurePassword123!"
  name           = "test-vm"
  size           = "Standard_D2s_v3"

  # Network
  network_interface_ids = ["/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-resource-group/providers/Microsoft.Network/networkInterfaces/networkInterfaceValue"]

  # OS Disk Configuration
  os_disk = [{
    caching              = "ReadWrite"
    disk_size_gb         = 30
    storage_account_type = "Standard_LRS"
    diff_disk_settings = [{
      option    = "Local"
      placement = "CacheDisk"
    }]
  }]

  # Authentication
  disable_password_authentication = false
  admin_ssh_key                   = []

  # Image Reference
  source_image_reference = [{
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }]

  # Optional Features
  additional_capabilities = [{
    ultra_ssd_enabled = true
  }]

  boot_diagnostics = [{
    storage_account_uri = "https://storageaccount.blob.core.windows.net/"
  }]

  identity = [{
    type = "SystemAssigned"
  }]

  tags = {
    Environment = "Test"
  }

  # Optional Settings (uncomment as needed)
  availability_set_id                                    = null
  encryption_at_host_enabled                             = true
  secure_boot_enabled                                    = true
  vtpm_enabled                                           = true
  zone                                                   = "1"
  vm_agent_platform_updates_enabled                      = null
  virtual_machine_scale_set_id                           = null
  user_data                                              = null
  timeouts                                               = null
  termination_notification                               = []
  source_image_id                                        = null
  secret                                                 = []
  reboot_setting                                         = null
  proximity_placement_group_id                           = null
  provision_vm_agent                                     = null
  priority                                               = null
  platform_fault_domain                                  = null
  plan                                                   = []
  patch_mode                                             = null
  patch_assessment_mode                                  = null
  os_image_notification                                  = []
  max_bid_price                                          = null
  license_type                                           = null
  gallery_application                                    = []
  extensions_time_budget                                 = null
  eviction_policy                                        = null
  edge_zone                                              = null
  disk_controller_type                                   = null
  dedicated_host_id                                      = null
  dedicated_host_group_id                                = null
  custom_data                                            = null
  computer_name                                          = null
  capacity_reservation_group_id                          = null
  bypass_platform_safety_checks_on_user_schedule_enabled = null
  allow_extension_operations                             = null

}

run "validate_virtual_machine" {
  command = plan

  assert {
    condition     = azurerm_linux_virtual_machine.this.size == "Standard_D2s_v3"
    error_message = "The VM size is not set to 'Standard_D2s_v3'."
  }

  assert {
    condition     = length(azurerm_linux_virtual_machine.this.network_interface_ids) > 0
    error_message = "No network interfaces attached to the virtual machine."
  }
}

