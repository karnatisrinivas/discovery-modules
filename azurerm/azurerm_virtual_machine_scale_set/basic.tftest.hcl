variables {
  name                  = "virtual-machine"
  create_resource_group = false
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  network_profile = [
    {
      name    = "network-profile"
      primary = false
      ip_configuration = [
        {
          primary                                      = true
          name                                         = "ip-conf"
          subnet_id                                    = "/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/virtualNetworks/{vnet-name}/subnets/{subnet-name}"
          application_gateway_backend_address_pool_ids = []
          application_security_group_ids               = []
          load_balancer_backend_address_pool_ids       = []
          load_balancer_inbound_nat_rules_ids          = []
          public_ip_address_configuration = [
            {
              name              = "pub"
              idle_timeout      = 4
              domain_name_label = "domain"
            }
          ]
        }
      ]
      dns_settings = []
    }
  ]
  os_profile = [
    {
      computer_name_prefix = "pc"
      admin_password       = "12345"
      admin_username       = "admin"
    }
  ]
  os_profile_windows_config = []
  os_profile_linux_config   = []
  sku = [
    {
      name     = "sku"
      capacity = 1
    }
  ]
  storage_profile_os_disk = [
    {
      create_option  = "FromImage"
      vhd_containers = []
    }
  ]
  proximity_placement_group_id = ""
  upgrade_policy_mode          = "Automatic"
  identity = [
    {
      type         = "SystemAssigned"
      identity_ids = []
    }
  ]
  automatic_os_upgrade            = false
  boot_diagnostics                = []
  extension                       = []
  eviction_policy                 = "Delete"
  health_probe_id                 = null
  license_type                    = "Windows_Client"
  os_profile_secrets              = []
  overprovision                   = true
  plan                            = []
  priority                        = "Low"
  rolling_upgrade_policy          = []
  single_placement_group          = true
  tags                            = {}
  zones                           = []
  storage_profile_data_disk       = []
  storage_profile_image_reference = []
}

run "test" {
  command = plan
  assert {
    condition     = azurerm_virtual_machine_scale_set.this.name == "virtual-machine"
    error_message = "azurerm_virtual_machine_scale_set was not successful"
  }
}