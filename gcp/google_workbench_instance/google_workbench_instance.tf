resource "google_workbench_instance" "this" {
  desired_state               = var.desired_state
  disable_proxy_access        = var.disable_proxy_access
  enable_third_party_identity = var.enable_third_party_identity
  instance_id                 = var.instance_id
  instance_owners             = var.instance_owners
  labels                      = var.labels
  location                    = var.location
  name                        = var.name

  dynamic "gce_setup" {
    for_each = var.gce_setup
    content {
      disable_public_ip    = gce_setup.value.disable_public_ip
      enable_ip_forwarding = gce_setup.value.enable_ip_forwarding
      machine_type         = gce_setup.value.machine_type
      metadata             = gce_setup.value.metadata
      tags                 = gce_setup.value.tags

      dynamic "accelerator_configs" {
        for_each = gce_setup.value.accelerator_configs
        content {
          core_count = accelerator_configs.value.core_count
          type       = accelerator_configs.value.type
        }
      }

      dynamic "boot_disk" {
        for_each = gce_setup.value.boot_disk
        content {
          disk_encryption = boot_disk.value.disk_encryption
          disk_size_gb    = boot_disk.value.disk_size_gb
          disk_type       = boot_disk.value.disk_type
          kms_key         = boot_disk.value.kms_key
        }
      }

      dynamic "confidential_instance_config" {
        for_each = gce_setup.value.confidential_instance_config
        content {
          confidential_instance_type = confidential_instance_config.value.confidential_instance_type
        }
      }

      dynamic "container_image" {
        for_each = gce_setup.value.container_image
        content {
          repository = container_image.value.repository
          tag        = container_image.value.tag
        }
      }

      dynamic "data_disks" {
        for_each = gce_setup.value.data_disks
        content {
          disk_encryption = data_disks.value.disk_encryption
          disk_size_gb    = data_disks.value.disk_size_gb
          disk_type       = data_disks.value.disk_type
          kms_key         = data_disks.value.kms_key
        }
      }

      dynamic "network_interfaces" {
        for_each = gce_setup.value.network_interfaces
        content {
          network  = network_interfaces.value.network
          nic_type = network_interfaces.value.nic_type
          subnet   = network_interfaces.value.subnet

          dynamic "access_configs" {
            for_each = network_interfaces.value.access_configs
            content {
              external_ip = access_configs.value.external_ip
            }
          }

        }
      }

      dynamic "service_accounts" {
        for_each = gce_setup.value.service_accounts
        content {
          email = service_accounts.value.email
        }
      }

      dynamic "shielded_instance_config" {
        for_each = gce_setup.value.shielded_instance_config
        content {
          enable_integrity_monitoring = shielded_instance_config.value.enable_integrity_monitoring
          enable_secure_boot          = shielded_instance_config.value.enable_secure_boot
          enable_vtpm                 = shielded_instance_config.value.enable_vtpm
        }
      }

      dynamic "vm_image" {
        for_each = gce_setup.value.vm_image
        content {
          family  = vm_image.value.family
          name    = vm_image.value.name
          project = vm_image.value.project
        }
      }

    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
