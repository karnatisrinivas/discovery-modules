resource "azurerm_windows_virtual_machine" "this" {
  admin_password        = var.admin_password
  admin_username        = var.admin_username
  location              = var.location
  name                  = var.name
  network_interface_ids = var.network_interface_ids
  resource_group_name   = var.resource_group_name
  size                  = var.size

  allow_extension_operations                             = var.allow_extension_operations
  availability_set_id                                    = var.availability_set_id
  bypass_platform_safety_checks_on_user_schedule_enabled = var.bypass_platform_safety_checks_on_user_schedule_enabled
  capacity_reservation_group_id                          = var.capacity_reservation_group_id
  computer_name                                          = var.computer_name
  custom_data                                            = var.custom_date
  dedicated_host_group_id                                = var.dedicated_host_group_id
  dedicated_host_id                                      = var.dedicated_host_id
  edge_zone                                              = var.edge_zone
  disk_controller_type                                   = var.disk_controller_type
  enable_automatic_updates                               = var.enable_automatic_updates
  encryption_at_host_enabled                             = var.encryption_at_host_enabled
  eviction_policy                                        = var.eviction_policy
  extensions_time_budget                                 = var.extensions_time_budget
  hotpatching_enabled                                    = var.hotpatching_enabled
  license_type                                           = var.license_type
  max_bid_price                                          = var.max_bid_price
  patch_assessment_mode                                  = var.patch_assessment_mode
  patch_mode                                             = var.patch_mode
  platform_fault_domain                                  = var.platform_fault_domain
  priority                                               = var.priority
  provision_vm_agent                                     = var.provision_vm_agent
  proximity_placement_group_id                           = var.proximity_placement_group_id
  reboot_setting                                         = var.reboot_setting
  secure_boot_enabled                                    = var.secure_boot_enabled
  source_image_id                                        = var.source_image_id
  tags                                                   = var.tags
  timezone                                               = var.timezone
  user_data                                              = var.user_data
  virtual_machine_scale_set_id                           = var.virtual_machine_scale_set_id
  vm_agent_platform_updates_enabled                      = var.vm_agent_platform_updates_enabled
  vtpm_enabled                                           = var.vtpm_enabled
  zone                                                   = var.zone


  dynamic "os_disk" {
    for_each = var.os_disk

    content {
      caching                          = os_disk.value.caching
      storage_account_type             = os_disk.value.storage_account_type
      disk_encryption_set_id           = os_disk.value.disk_encryption_set_id
      disk_size_gb                     = os_disk.value.disk_size_gb
      name                             = os_disk.value.name
      secure_vm_disk_encryption_set_id = os_disk.value.secure_vm_disk_encryption_set_id
      security_encryption_type         = os_disk.value.security_encryption_type
      write_accelerator_enabled        = os_disk.value.write_accelerator_enabled

      dynamic "diff_disk_settings" {
        for_each = os_disk.value.diff_disk_settings

        content {
          option    = diff_disk_settings.value.option
          placement = diff_disk_settings.value.placement
        }
      }
    }
  }

  dynamic "additional_capabilities" {
    for_each = var.additional_capabilities

    content {
      ultra_ssd_enabled   = additional_capabilities.value.ultra_ssd_enabled
      hibernation_enabled = additional_capabilities.value.hibernation_enabled
    }
  }

  dynamic "additional_unattend_content" {
    for_each = var.additional_unattend_content

    content {
      content = additional_unattend_content.value.content
      setting = additional_unattend_content.value.setting
    }
  }

  dynamic "boot_diagnostics" {
    for_each = var.boot_diagnostics

    content {
      storage_account_uri = boot_diagnostics.value.storage_account_uri
    }
  }

  dynamic "gallery_application" {
    for_each = var.gallery_application

    content {
      version_id                                  = gallery_application.value.version_id
      automatic_upgrade_enabled                   = gallery_application.value.automatic_upgrade_enabled
      configuration_blob_uri                      = gallery_application.value.configuration_blob_uri
      order                                       = gallery_application.value.order
      tag                                         = gallery_application.value.tag
      treat_failure_as_deployment_failure_enabled = gallery_application.value.treat_failure_as_deployment_failure_enabled
    }
  }

  dynamic "identity" {
    for_each = var.identity

    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "plan" {
    for_each = var.plan
    content {
      name      = plan.value.name
      product   = plan.value.product
      publisher = plan.value.publisher
    }
  }

  dynamic "secret" {
    for_each = var.secret

    content {
      key_vault_id = secret.value.key_vault_id

      dynamic "certificate" {
        for_each = secret.value.certificate

        content {
          store = certificate.value.store
          url   = certificate.value.url
        }
      }
    }
  }

  dynamic "source_image_reference" {
    for_each = var.source_image_reference

    content {
      publisher = source_image_reference.value.publisher
      offer     = source_image_reference.value.offer
      sku       = source_image_reference.value.sku
      version   = source_image_reference.value.version
    }
  }

  os_image_notification {
    timeout = "PT15M"
  }

  dynamic "termination_notification" {
    for_each = var.termination_notification

    content {
      enabled = termination_notification.value.enabled
      timeout = termination_notification.value.timeout
    }
  }

  dynamic "winrm_listener" {
    for_each = var.winrm_listener

    content {
      protocol        = winrm_listener.value.protocol
      certificate_url = winrm_listener.value.certificate_url
    }
  }
}
