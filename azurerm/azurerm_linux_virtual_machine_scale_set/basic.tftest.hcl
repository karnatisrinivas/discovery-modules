variables {
  # Required variables - user should provide these
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"
  admin_username        = "testadmin"
  admin_password        = "Admin@123Secure!"
  name                  = "testvmss"
  sku                   = "Standard_B1s"
  subnet_id             = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg/providers/Microsoft.Network/virtualNetworks/example-vnet/subnets/default"

  # OS Disk variables
  caching              = "ReadWrite"
  storage_account_type = "Standard_LRS"

  # Source Image Reference variables
  publisher  = "Canonical"
  offer      = "UbuntuServer"
  os_sku     = "18.04-LTS"
  os_version = "latest"

  # Optional variables with default or null values
  capacity_reservation_group_id                     = null
  custom_data                                       = null
  disable_password_authentication                   = false
  do_not_run_extensions_on_overprovisioned_machines = null
  edge_zone                                         = null
  encryption_at_host_enabled                        = null
  eviction_policy                                   = null
  extensions_time_budget                            = "PT1H30M"
  health_probe_id                                   = null
  host_group_id                                     = null
  instances                                         = 1
  max_bid_price                                     = null
  overprovision                                     = true
  priority                                          = "Regular"
  provision_vm_agent                                = true
  proximity_placement_group_id                      = null
  secure_boot_enabled                               = null
  single_placement_group                            = true
  source_image_id                                   = null
  tags                                              = null
  upgrade_mode                                      = "Manual"
  user_data                                         = null
  vtpm_enabled                                      = null
  zone_balance                                      = null
  zones                                             = null
}

run "create_azure_linux_vmss" {
  command = apply

  assert {
    condition     = azurerm_linux_virtual_machine_scale_set.this.name == var.name
    error_message = "VMSS name does not match expected value"
  }

  assert {
    condition     = azurerm_linux_virtual_machine_scale_set.this.sku == var.sku
    error_message = "VMSS SKU does not match expected value"
  }

  assert {
    condition     = azurerm_linux_virtual_machine_scale_set.this.admin_username == var.admin_username
    error_message = "Admin username does not match expected value"
  }
}