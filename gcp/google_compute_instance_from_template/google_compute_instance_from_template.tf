resource "google_compute_instance_from_template" "this" {
  allow_stopping_for_update  = var.allow_stopping_for_update
  can_ip_forward             = var.can_ip_forward
  deletion_protection        = var.deletion_protection
  description                = var.description
  desired_status             = var.desired_status
  enable_display             = var.enable_display
  hostname                   = var.hostname
  key_revocation_action_type = var.key_revocation_action_type
  labels                     = var.labels
  machine_type               = var.machine_type
  metadata                   = var.metadata
  metadata_startup_script    = var.metadata_startup_script
  min_cpu_platform           = var.min_cpu_platform
  name                       = var.name
  resource_policies          = var.resource_policies
  source_instance_template   = var.source_instance_template
  tags                       = var.tags
  zone                       = var.zone

  dynamic "advanced_machine_features" {
    for_each = var.advanced_machine_features
    content {
      enable_nested_virtualization = advanced_machine_features.value.enable_nested_virtualization
      enable_uefi_networking       = advanced_machine_features.value.enable_uefi_networking
      performance_monitoring_unit  = advanced_machine_features.value.performance_monitoring_unit
      threads_per_core             = advanced_machine_features.value.threads_per_core
      turbo_mode                   = advanced_machine_features.value.turbo_mode
      visible_core_count           = advanced_machine_features.value.visible_core_count
    }
  }

  dynamic "attached_disk" {
    for_each = var.attached_disk
    content {
      device_name             = attached_disk.value.device_name
      disk_encryption_key_raw = attached_disk.value.disk_encryption_key_raw
      kms_key_self_link       = attached_disk.value.kms_key_self_link
      mode                    = attached_disk.value.mode
      source                  = attached_disk.value.source
    }
  }

  dynamic "boot_disk" {
    for_each = var.boot_disk
    content {
      auto_delete             = boot_disk.value.auto_delete
      device_name             = boot_disk.value.device_name
      disk_encryption_key_raw = boot_disk.value.disk_encryption_key_raw
      interface               = boot_disk.value.interface
      kms_key_self_link       = boot_disk.value.kms_key_self_link
      mode                    = boot_disk.value.mode
      source                  = boot_disk.value.source

      dynamic "initialize_params" {
        for_each = boot_disk.value.initialize_params
        content {
          enable_confidential_compute = initialize_params.value.enable_confidential_compute
          image                       = initialize_params.value.image
          labels                      = initialize_params.value.labels
          provisioned_iops            = initialize_params.value.provisioned_iops
          provisioned_throughput      = initialize_params.value.provisioned_throughput
          resource_manager_tags       = initialize_params.value.resource_manager_tags
          resource_policies           = initialize_params.value.resource_policies
          size                        = initialize_params.value.size
          storage_pool                = initialize_params.value.storage_pool
          type                        = initialize_params.value.type
        }
      }

    }
  }

  dynamic "confidential_instance_config" {
    for_each = var.confidential_instance_config
    content {
      confidential_instance_type  = confidential_instance_config.value.confidential_instance_type
      enable_confidential_compute = confidential_instance_config.value.enable_confidential_compute
    }
  }

  dynamic "guest_accelerator" {
    for_each = var.guest_accelerator
    content {
      count = guest_accelerator.value.count
      type  = guest_accelerator.value.type
    }
  }

  dynamic "network_interface" {
    for_each = var.network_interface
    content {
      internal_ipv6_prefix_length = network_interface.value.internal_ipv6_prefix_length
      ipv6_address                = network_interface.value.ipv6_address
      network                     = network_interface.value.network
      network_attachment          = network_interface.value.network_attachment
      network_ip                  = network_interface.value.network_ip
      nic_type                    = network_interface.value.nic_type
      queue_count                 = network_interface.value.queue_count
      stack_type                  = network_interface.value.stack_type
      subnetwork                  = network_interface.value.subnetwork
      subnetwork_project          = network_interface.value.subnetwork_project

      dynamic "access_config" {
        for_each = network_interface.value.access_config
        content {
          nat_ip                 = access_config.value.nat_ip
          network_tier           = access_config.value.network_tier
          public_ptr_domain_name = access_config.value.public_ptr_domain_name
        }
      }

      dynamic "alias_ip_range" {
        for_each = network_interface.value.alias_ip_range
        content {
          ip_cidr_range         = alias_ip_range.value.ip_cidr_range
          subnetwork_range_name = alias_ip_range.value.subnetwork_range_name
        }
      }

      dynamic "ipv6_access_config" {
        for_each = network_interface.value.ipv6_access_config
        content {
          external_ipv6               = ipv6_access_config.value.external_ipv6
          external_ipv6_prefix_length = ipv6_access_config.value.external_ipv6_prefix_length
          name                        = ipv6_access_config.value.name
          network_tier                = ipv6_access_config.value.network_tier
          public_ptr_domain_name      = ipv6_access_config.value.public_ptr_domain_name
        }
      }

    }
  }

  dynamic "network_performance_config" {
    for_each = var.network_performance_config
    content {
      total_egress_bandwidth_tier = network_performance_config.value.total_egress_bandwidth_tier
    }
  }

  dynamic "params" {
    for_each = var.params
    content {
      resource_manager_tags = params.value.resource_manager_tags
    }
  }

  dynamic "reservation_affinity" {
    for_each = var.reservation_affinity
    content {
      type = reservation_affinity.value.type

      dynamic "specific_reservation" {
        for_each = reservation_affinity.value.specific_reservation
        content {
          key    = specific_reservation.value.key
          values = specific_reservation.value.values
        }
      }

    }
  }

  dynamic "scheduling" {
    for_each = var.scheduling
    content {
      automatic_restart           = scheduling.value.automatic_restart
      availability_domain         = scheduling.value.availability_domain
      instance_termination_action = scheduling.value.instance_termination_action
      min_node_cpus               = scheduling.value.min_node_cpus
      on_host_maintenance         = scheduling.value.on_host_maintenance
      preemptible                 = scheduling.value.preemptible
      provisioning_model          = scheduling.value.provisioning_model
      termination_time            = scheduling.value.termination_time

      dynamic "local_ssd_recovery_timeout" {
        for_each = scheduling.value.local_ssd_recovery_timeout
        content {
          nanos   = local_ssd_recovery_timeout.value.nanos
          seconds = local_ssd_recovery_timeout.value.seconds
        }
      }

      dynamic "max_run_duration" {
        for_each = scheduling.value.max_run_duration
        content {
          nanos   = max_run_duration.value.nanos
          seconds = max_run_duration.value.seconds
        }
      }

      dynamic "node_affinities" {
        for_each = scheduling.value.node_affinities
        content {
          key      = node_affinities.value.key
          operator = node_affinities.value.operator
          values   = node_affinities.value.values
        }
      }

      dynamic "on_instance_stop_action" {
        for_each = scheduling.value.on_instance_stop_action
        content {
          discard_local_ssd = on_instance_stop_action.value.discard_local_ssd
        }
      }

    }
  }

  dynamic "scratch_disk" {
    for_each = var.scratch_disk
    content {
      device_name = scratch_disk.value.device_name
      interface   = scratch_disk.value.interface
      size        = scratch_disk.value.size
    }
  }

  dynamic "service_account" {
    for_each = var.service_account
    content {
      email  = service_account.value.email
      scopes = service_account.value.scopes
    }
  }

  dynamic "shielded_instance_config" {
    for_each = var.shielded_instance_config
    content {
      enable_integrity_monitoring = shielded_instance_config.value.enable_integrity_monitoring
      enable_secure_boot          = shielded_instance_config.value.enable_secure_boot
      enable_vtpm                 = shielded_instance_config.value.enable_vtpm
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
