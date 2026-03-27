variables {
  create_resource_group            = "false"
  subscription_id                  = "12345678-1234-9876-4563-123456789012"
  location                         = "East US"
  resource_group_name              = "example-azure-rg"
  name                             = "example-vm"
  vm_size                          = "Standard_DS1_v2"
  admin_username                   = "exampleadmin"
  admin_password                   = "Password1234!"
  network_interface_ids            = ["/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-azure-rg/providers/Microsoft.Network/networkInterfaces/example-nic"]
  availability_set_id              = null
  enabled                          = true
  storage_uri                      = "http://examplestorageacct.blob.core.windows.net"
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true
  id                               = null
  publisher                        = "Canonical"
  offer                            = "UbuntuServer"
  sku                              = "16.04.0-LTS"
  image_version                    = "latest"
  computer_name                    = "myvm"
  type                             = "SystemAssigned"
  identity_ids                     = null
  disable_password_authentication  = false
  ssh_keys                         = []
  provision_vm_agent               = false
  enable_automatic_upgrades        = false
  timezone                         = ""
  protocol                         = ""
  certificate_url                  = ""
  pass                             = ""
  component                        = ""
  setting_name                     = ""
  content                          = ""

  storage_data_disk = [{
    name          = "mydatadisk1"
    create_option = "Empty"
    disk_size_gb  = 30
    lun           = 0
    caching       = "None"
  }]
  tags = {
    environment = "staging"
  }

  storage_os_disk = [
    {
      name                      = "myosdisk1"
      create_option             = "FromImage"
      disk_size_gb              = 30
      caching                   = "ReadWrite"
      os_type                   = "Linux"
      write_accelerator_enabled = false
      image_uri                 = ""
    }
  ]


}

run "test" {
  command = plan
  assert {
    condition     = azurerm_virtual_machine.this.name == "example-vm"
    error_message = "Virtual Machine did not Create Successfully"
  }
}