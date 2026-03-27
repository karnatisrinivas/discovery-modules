resource "azurerm_virtual_machine_scale_set" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  upgrade_policy_mode = var.upgrade_policy_mode

  proximity_placement_group_id = var.proximity_placement_group_id
  automatic_os_upgrade         = var.automatic_os_upgrade
  eviction_policy              = var.eviction_policy
  health_probe_id              = var.health_probe_id
  license_type                 = var.license_type
  overprovision                = var.overprovision
  priority                     = var.priority
  single_placement_group       = var.single_placement_group
  tags                         = var.tags
  zones                        = var.zones

  dynamic "network_profile" {
    for_each = var.network_profile

    content {
      name                      = network_profile.value.name
      primary                   = network_profile.value.primary
      accelerated_networking    = network_profile.value.accelerated_networking
      ip_forwarding             = network_profile.value.ip_forwarding
      network_security_group_id = network_profile.value.network_security_group_id

      dynamic "dns_settings" {
        for_each = network_profile.value.dns_settings
        content {
          dns_servers = dns_settings.value.dns_servers
        }
      }

      dynamic "ip_configuration" {
        for_each = network_profile.value.ip_configuration
        content {
          name                                         = ip_configuration.value.name
          subnet_id                                    = ip_configuration.value.subnet_id
          application_gateway_backend_address_pool_ids = ip_configuration.value.application_gateway_backend_address_pool_ids
          load_balancer_backend_address_pool_ids       = ip_configuration.value.load_balancer_backend_address_pool_ids
          load_balancer_inbound_nat_rules_ids          = ip_configuration.value.load_balancer_inbound_nat_rules_ids
          primary                                      = ip_configuration.value.primary
          application_security_group_ids               = ip_configuration.value.application_security_group_ids

          dynamic "public_ip_address_configuration" {
            for_each = ip_configuration.value.public_ip_address_configuration
            content {
              name              = public_ip_address_configuration.value.name
              idle_timeout      = public_ip_address_configuration.value.idle_timeout
              domain_name_label = public_ip_address_configuration.value.domain_name_label
            }
          }
        }
      }
    }
  }

  dynamic "os_profile" {
    for_each = var.os_profile
    content {
      computer_name_prefix = os_profile.value.computer_name_prefix
      admin_password       = os_profile.value.admin_password
      admin_username       = os_profile.value.admin_username
      custom_data          = os_profile.value.custom_data
    }
  }

  dynamic "sku" {
    for_each = var.sku
    content {
      name     = sku.value.name
      capacity = sku.value.capacity
      tier     = sku.value.tier
    }
  }

  dynamic "storage_profile_os_disk" {
    for_each = var.storage_profile_os_disk
    content {
      create_option     = storage_profile_os_disk.value.create_option
      name              = storage_profile_os_disk.value.name
      vhd_containers    = storage_profile_os_disk.value.vhd_containers
      managed_disk_type = storage_profile_os_disk.value.managed_disk_type
      caching           = storage_profile_os_disk.value.caching
      image             = storage_profile_os_disk.value.image
      os_type           = storage_profile_os_disk.value.os_type
    }
  }

  dynamic "os_profile_windows_config" {
    for_each = var.os_profile_windows_config
    content {
      provision_vm_agent        = os_profile_windows_config.value.provision_vm_agent
      enable_automatic_upgrades = os_profile_windows_config.value.enable_automatic_upgrades
      dynamic "winrm" {
        for_each = os_profile_windows_config.value.winrm
        content {
          protocol        = winrm.value.protocol
          certificate_url = winrm.value.certificate_url
        }
      }
      dynamic "additional_unattend_config" {
        for_each = os_profile_windows_config.value.additional_unattend_config
        content {
          pass         = additional_unattend_config.value.pass
          component    = additional_unattend_config.component
          setting_name = additional_unattend_config.setting_name
          content      = additional_unattend_config.content
        }
      }
    }
  }

  dynamic "os_profile_linux_config" {
    for_each = var.os_profile_linux_config
    content {
      disable_password_authentication = os_profile_linux_config.value.disable_password_authentication
      dynamic "ssh_keys" {
        for_each = os_profile_linux_config.value.ssh_keys
        content {
          path     = ssh_keys.value.path
          key_data = ssh_keys.value.key_data
        }
      }
    }
  }

  dynamic "identity" {
    for_each = var.identity
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "boot_diagnostics" {
    for_each = var.boot_diagnostics
    content {
      enabled     = boot_diagnostics.value.enabled
      storage_uri = boot_diagnostics.value.storage_uri
    }
  }

  dynamic "extension" {
    for_each = var.extension
    content {
      name                       = extension.value.name
      publisher                  = extension.value.publisher
      type                       = extension.value.type
      type_handler_version       = extension.value.type_handler_version
      auto_upgrade_minor_version = extension.value.auto_upgrade_minor_version
      provision_after_extensions = extension.value.provision_after_extensions
      settings                   = extension.value.settings
      protected_settings         = extension.value.protected_settings
    }
  }

  dynamic "os_profile_secrets" {
    for_each = var.os_profile_secrets
    content {
      source_vault_id = os_profile_secrets.value.source_vault_id
      dynamic "vault_certificates" {
        for_each = os_profile_secrets.value.vault_certificates
        content {
          certificate_url   = vault_certificates.value.certificate_url
          certificate_store = vault_certificates.value.certificate_store
        }
      }
    }
  }

  dynamic "plan" {
    for_each = var.plan
    content {
      name      = plan.value.name
      publisher = plan.value.publisher
      product   = plan.value.product
    }
  }

  dynamic "rolling_upgrade_policy" {
    for_each = var.rolling_upgrade_policy
    content {
      max_batch_instance_percent              = rolling_upgrade_policy.value.max_batch_instance_percent
      max_unhealthy_instance_percent          = rolling_upgrade_policy.value.max_unhealthy_instance_percent
      max_unhealthy_upgraded_instance_percent = rolling_upgrade_policy.value.max_unhealthy_upgraded_instance_percent
      pause_time_between_batches              = rolling_upgrade_policy.value.pause_time_between_batches
    }
  }

  dynamic "storage_profile_data_disk" {
    for_each = var.storage_profile_data_disk
    content {
      lun               = storage_profile_data_disk.value.lun
      create_option     = storage_profile_data_disk.value.create_option
      caching           = storage_profile_data_disk.value.caching
      disk_size_gb      = storage_profile_data_disk.value.disk_size_gb
      managed_disk_type = storage_profile_data_disk.value.managed_disk_type
    }
  }

  dynamic "storage_profile_image_reference" {
    for_each = var.storage_profile_image_reference
    content {
      id        = storage_profile_image_reference.value.id
      publisher = storage_profile_image_reference.value.publisher
      offer     = storage_profile_image_reference.value.offer
      sku       = storage_profile_image_reference.value.sku
      version   = storage_profile_image_reference.value.version
    }
  }
}