resource "azurerm_virtual_machine" "this" {
  name                             = var.name
  location                         = var.location
  resource_group_name              = var.resource_group_name
  vm_size                          = var.vm_size
  network_interface_ids            = var.network_interface_ids
  delete_data_disks_on_termination = var.delete_data_disks_on_termination
  delete_os_disk_on_termination    = var.delete_os_disk_on_termination
  availability_set_id              = var.availability_set_id
  tags                             = var.tags

  storage_image_reference {
    id        = var.id
    publisher = var.id == null ? var.publisher : null
    offer     = var.id == null ? var.offer : null
    sku       = var.id == null ? var.sku : null
    version   = var.id == null ? var.image_version : null
  }

  dynamic "storage_os_disk" {
    for_each = var.storage_os_disk
    content {
      name                      = storage_os_disk.value.name
      caching                   = storage_os_disk.value.caching
      create_option             = storage_os_disk.value.create_option
      disk_size_gb              = storage_os_disk.value.disk_size_gb
      os_type                   = storage_os_disk.value.os_type
      write_accelerator_enabled = storage_os_disk.value.write_accelerator_enabled
      image_uri                 = storage_os_disk.value.image_uri
    }

  }

  dynamic "storage_data_disk" {
    for_each = var.storage_data_disk
    content {
      name          = storage_data_disk.value.name
      caching       = storage_data_disk.value.caching
      create_option = storage_data_disk.value.create_option
      disk_size_gb  = storage_data_disk.value.disk_size_gb
      lun           = storage_data_disk.value.lun
    }
  }

  dynamic "os_profile_linux_config" {
    for_each = var.storage_os_disk[0].os_type == "Linux" ? [1] : []
    content {
      disable_password_authentication = var.disable_password_authentication
      dynamic "ssh_keys" {
        for_each = var.ssh_keys
        content {
          path     = ssh_keys.value.path
          key_data = ssh_keys.value.key_data
        }
      }
    }
  }

  dynamic "os_profile_windows_config" {
    for_each = var.storage_os_disk[0].os_type == "Windows" ? [1] : []
    content {
      provision_vm_agent        = var.provision_vm_agent
      enable_automatic_upgrades = var.enable_automatic_upgrades
      timezone                  = var.timezone
      winrm {
        protocol        = var.protocol
        certificate_url = var.certificate_url
      }
      additional_unattend_config {
        pass         = var.pass
        component    = var.component
        setting_name = var.setting_name
        content      = var.content
      }
    }
  }

  os_profile {
    computer_name  = var.computer_name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  boot_diagnostics {
    enabled     = var.enabled
    storage_uri = var.storage_uri
  }

  identity {
    type         = var.type
    identity_ids = var.identity_ids
  }

}