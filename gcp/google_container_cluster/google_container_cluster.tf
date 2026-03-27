resource "google_container_cluster" "this" {
  allow_net_admin                          = var.allow_net_admin
  cluster_ipv4_cidr                        = var.cluster_ipv4_cidr
  datapath_provider                        = var.datapath_provider
  default_max_pods_per_node                = var.default_max_pods_per_node
  deletion_protection                      = var.deletion_protection
  description                              = var.description
  disable_l4_lb_firewall_reconciliation    = var.disable_l4_lb_firewall_reconciliation
  enable_autopilot                         = var.enable_autopilot
  enable_cilium_clusterwide_network_policy = var.enable_cilium_clusterwide_network_policy
  enable_fqdn_network_policy               = var.enable_fqdn_network_policy
  enable_intranode_visibility              = var.enable_intranode_visibility
  enable_kubernetes_alpha                  = var.enable_kubernetes_alpha
  enable_l4_ilb_subsetting                 = var.enable_l4_ilb_subsetting
  enable_legacy_abac                       = var.enable_legacy_abac
  enable_multi_networking                  = var.enable_multi_networking
  enable_shielded_nodes                    = var.enable_shielded_nodes
  enable_tpu                               = var.enable_tpu
  initial_node_count                       = var.initial_node_count
  location                                 = var.location
  logging_service                          = var.logging_service
  min_master_version                       = var.min_master_version
  monitoring_service                       = var.monitoring_service
  name                                     = var.name
  network                                  = var.network
  networking_mode                          = var.networking_mode
  node_locations                           = var.node_locations
  node_version                             = var.node_version
  private_ipv6_google_access               = var.private_ipv6_google_access
  remove_default_node_pool                 = var.remove_default_node_pool
  resource_labels                          = var.resource_labels
  subnetwork                               = var.subnetwork

  dynamic "addons_config" {
    for_each = var.addons_config
    content {
      dynamic "cloudrun_config" {
        for_each = addons_config.value.cloudrun_config
        content {
          disabled           = cloudrun_config.value.disabled
          load_balancer_type = cloudrun_config.value.load_balancer_type
        }
      }

      dynamic "config_connector_config" {
        for_each = addons_config.value.config_connector_config
        content {
          enabled = config_connector_config.value.enabled
        }
      }

      dynamic "dns_cache_config" {
        for_each = addons_config.value.dns_cache_config
        content {
          enabled = dns_cache_config.value.enabled
        }
      }

      dynamic "gce_persistent_disk_csi_driver_config" {
        for_each = addons_config.value.gce_persistent_disk_csi_driver_config
        content {
          enabled = gce_persistent_disk_csi_driver_config.value.enabled
        }
      }

      dynamic "gcp_filestore_csi_driver_config" {
        for_each = addons_config.value.gcp_filestore_csi_driver_config
        content {
          enabled = gcp_filestore_csi_driver_config.value.enabled
        }
      }

      dynamic "gcs_fuse_csi_driver_config" {
        for_each = addons_config.value.gcs_fuse_csi_driver_config
        content {
          enabled = gcs_fuse_csi_driver_config.value.enabled
        }
      }

      dynamic "gke_backup_agent_config" {
        for_each = addons_config.value.gke_backup_agent_config
        content {
          enabled = gke_backup_agent_config.value.enabled
        }
      }

      dynamic "horizontal_pod_autoscaling" {
        for_each = addons_config.value.horizontal_pod_autoscaling
        content {
          disabled = horizontal_pod_autoscaling.value.disabled
        }
      }

      dynamic "http_load_balancing" {
        for_each = addons_config.value.http_load_balancing
        content {
          disabled = http_load_balancing.value.disabled
        }
      }

      dynamic "network_policy_config" {
        for_each = addons_config.value.network_policy_config
        content {
          disabled = network_policy_config.value.disabled
        }
      }

      dynamic "parallelstore_csi_driver_config" {
        for_each = addons_config.value.parallelstore_csi_driver_config
        content {
          enabled = parallelstore_csi_driver_config.value.enabled
        }
      }

      dynamic "ray_operator_config" {
        for_each = addons_config.value.ray_operator_config
        content {
          enabled = ray_operator_config.value.enabled

          dynamic "ray_cluster_logging_config" {
            for_each = ray_operator_config.value.ray_cluster_logging_config
            content {
              enabled = ray_cluster_logging_config.value.enabled
            }
          }

          dynamic "ray_cluster_monitoring_config" {
            for_each = ray_operator_config.value.ray_cluster_monitoring_config
            content {
              enabled = ray_cluster_monitoring_config.value.enabled
            }
          }

        }
      }

      dynamic "stateful_ha_config" {
        for_each = addons_config.value.stateful_ha_config
        content {
          enabled = stateful_ha_config.value.enabled
        }
      }

    }
  }

  dynamic "authenticator_groups_config" {
    for_each = var.authenticator_groups_config
    content {
      security_group = authenticator_groups_config.value.security_group
    }
  }

  dynamic "binary_authorization" {
    for_each = var.binary_authorization
    content {
      enabled         = binary_authorization.value.enabled
      evaluation_mode = binary_authorization.value.evaluation_mode
    }
  }

  dynamic "cluster_autoscaling" {
    for_each = var.cluster_autoscaling
    content {
      auto_provisioning_locations = cluster_autoscaling.value.auto_provisioning_locations
      autoscaling_profile         = cluster_autoscaling.value.autoscaling_profile
      enabled                     = cluster_autoscaling.value.enabled

      dynamic "auto_provisioning_defaults" {
        for_each = cluster_autoscaling.value.auto_provisioning_defaults
        content {
          boot_disk_kms_key = auto_provisioning_defaults.value.boot_disk_kms_key
          disk_size         = auto_provisioning_defaults.value.disk_size
          disk_type         = auto_provisioning_defaults.value.disk_type
          image_type        = auto_provisioning_defaults.value.image_type
          min_cpu_platform  = auto_provisioning_defaults.value.min_cpu_platform
          oauth_scopes      = auto_provisioning_defaults.value.oauth_scopes
          service_account   = auto_provisioning_defaults.value.service_account

          dynamic "management" {
            for_each = auto_provisioning_defaults.value.management
            content {
              auto_repair  = management.value.auto_repair
              auto_upgrade = management.value.auto_upgrade
            }
          }

          dynamic "shielded_instance_config" {
            for_each = auto_provisioning_defaults.value.shielded_instance_config
            content {
              enable_integrity_monitoring = shielded_instance_config.value.enable_integrity_monitoring
              enable_secure_boot          = shielded_instance_config.value.enable_secure_boot
            }
          }

          dynamic "upgrade_settings" {
            for_each = auto_provisioning_defaults.value.upgrade_settings
            content {
              max_surge       = upgrade_settings.value.max_surge
              max_unavailable = upgrade_settings.value.max_unavailable
              strategy        = upgrade_settings.value.strategy

              dynamic "blue_green_settings" {
                for_each = upgrade_settings.value.blue_green_settings
                content {
                  node_pool_soak_duration = blue_green_settings.value.node_pool_soak_duration

                  dynamic "standard_rollout_policy" {
                    for_each = blue_green_settings.value.standard_rollout_policy
                    content {
                      batch_node_count    = standard_rollout_policy.value.batch_node_count
                      batch_percentage    = standard_rollout_policy.value.batch_percentage
                      batch_soak_duration = standard_rollout_policy.value.batch_soak_duration
                    }
                  }

                }
              }

            }
          }

        }
      }

      dynamic "resource_limits" {
        for_each = cluster_autoscaling.value.resource_limits
        content {
          maximum       = resource_limits.value.maximum
          minimum       = resource_limits.value.minimum
          resource_type = resource_limits.value.resource_type
        }
      }

    }
  }

  dynamic "confidential_nodes" {
    for_each = var.confidential_nodes
    content {
      enabled = confidential_nodes.value.enabled
    }
  }

  dynamic "control_plane_endpoints_config" {
    for_each = var.control_plane_endpoints_config
    content {
      dynamic "dns_endpoint_config" {
        for_each = control_plane_endpoints_config.value.dns_endpoint_config
        content {
          allow_external_traffic = dns_endpoint_config.value.allow_external_traffic
          endpoint               = dns_endpoint_config.value.endpoint
        }
      }

      dynamic "ip_endpoints_config" {
        for_each = control_plane_endpoints_config.value.ip_endpoints_config
        content {
          enabled = ip_endpoints_config.value.enabled
        }
      }

    }
  }

  dynamic "cost_management_config" {
    for_each = var.cost_management_config
    content {
      enabled = cost_management_config.value.enabled
    }
  }

  dynamic "database_encryption" {
    for_each = var.database_encryption
    content {
      key_name = database_encryption.value.key_name
      state    = database_encryption.value.state
    }
  }

  dynamic "default_snat_status" {
    for_each = var.default_snat_status
    content {
      disabled = default_snat_status.value.disabled
    }
  }

  dynamic "dns_config" {
    for_each = var.dns_config
    content {
      additive_vpc_scope_dns_domain = dns_config.value.additive_vpc_scope_dns_domain
      cluster_dns                   = dns_config.value.cluster_dns
      cluster_dns_domain            = dns_config.value.cluster_dns_domain
      cluster_dns_scope             = dns_config.value.cluster_dns_scope
    }
  }

  dynamic "enable_k8s_beta_apis" {
    for_each = var.enable_k8s_beta_apis
    content {
      enabled_apis = enable_k8s_beta_apis.value.enabled_apis
    }
  }

  dynamic "enterprise_config" {
    for_each = var.enterprise_config
    content {
      desired_tier = enterprise_config.value.desired_tier
    }
  }

  dynamic "fleet" {
    for_each = var.fleet
    content {
      project = fleet.value.project
    }
  }

  dynamic "gateway_api_config" {
    for_each = var.gateway_api_config
    content {
      channel = gateway_api_config.value.channel
    }
  }

  dynamic "identity_service_config" {
    for_each = var.identity_service_config
    content {
      enabled = identity_service_config.value.enabled
    }
  }

  dynamic "ip_allocation_policy" {
    for_each = var.ip_allocation_policy
    content {
      cluster_ipv4_cidr_block       = ip_allocation_policy.value.cluster_ipv4_cidr_block
      cluster_secondary_range_name  = ip_allocation_policy.value.cluster_secondary_range_name
      services_ipv4_cidr_block      = ip_allocation_policy.value.services_ipv4_cidr_block
      services_secondary_range_name = ip_allocation_policy.value.services_secondary_range_name
      stack_type                    = ip_allocation_policy.value.stack_type

      dynamic "additional_pod_ranges_config" {
        for_each = ip_allocation_policy.value.additional_pod_ranges_config
        content {
          pod_range_names = additional_pod_ranges_config.value.pod_range_names
        }
      }

      dynamic "pod_cidr_overprovision_config" {
        for_each = ip_allocation_policy.value.pod_cidr_overprovision_config
        content {
          disabled = pod_cidr_overprovision_config.value.disabled
        }
      }

    }
  }

  dynamic "logging_config" {
    for_each = var.logging_config
    content {
      enable_components = logging_config.value.enable_components
    }
  }

  dynamic "maintenance_policy" {
    for_each = var.maintenance_policy
    content {
      dynamic "daily_maintenance_window" {
        for_each = maintenance_policy.value.daily_maintenance_window
        content {
          start_time = daily_maintenance_window.value.start_time
        }
      }

      dynamic "maintenance_exclusion" {
        for_each = maintenance_policy.value.maintenance_exclusion
        content {
          end_time       = maintenance_exclusion.value.end_time
          exclusion_name = maintenance_exclusion.value.exclusion_name
          start_time     = maintenance_exclusion.value.start_time

          dynamic "exclusion_options" {
            for_each = maintenance_exclusion.value.exclusion_options
            content {
              scope = exclusion_options.value.scope
            }
          }

        }
      }

      dynamic "recurring_window" {
        for_each = maintenance_policy.value.recurring_window
        content {
          end_time   = recurring_window.value.end_time
          recurrence = recurring_window.value.recurrence
          start_time = recurring_window.value.start_time
        }
      }

    }
  }

  dynamic "master_auth" {
    for_each = var.master_auth
    content {

      dynamic "client_certificate_config" {
        for_each = master_auth.value.client_certificate_config
        content {
          issue_client_certificate = client_certificate_config.value.issue_client_certificate
        }
      }

    }
  }

  dynamic "master_authorized_networks_config" {
    for_each = var.master_authorized_networks_config
    content {
      gcp_public_cidrs_access_enabled      = master_authorized_networks_config.value.gcp_public_cidrs_access_enabled
      private_endpoint_enforcement_enabled = master_authorized_networks_config.value.private_endpoint_enforcement_enabled

      dynamic "cidr_blocks" {
        for_each = master_authorized_networks_config.value.cidr_blocks
        content {
          cidr_block   = cidr_blocks.value.cidr_block
          display_name = cidr_blocks.value.display_name
        }
      }

    }
  }

  dynamic "mesh_certificates" {
    for_each = var.mesh_certificates
    content {
      enable_certificates = mesh_certificates.value.enable_certificates
    }
  }

  dynamic "monitoring_config" {
    for_each = var.monitoring_config
    content {
      enable_components = monitoring_config.value.enable_components

      dynamic "advanced_datapath_observability_config" {
        for_each = monitoring_config.value.advanced_datapath_observability_config
        content {
          enable_metrics = advanced_datapath_observability_config.value.enable_metrics
          enable_relay   = advanced_datapath_observability_config.value.enable_relay
        }
      }

      dynamic "managed_prometheus" {
        for_each = monitoring_config.value.managed_prometheus
        content {
          enabled = managed_prometheus.value.enabled

          dynamic "auto_monitoring_config" {
            for_each = managed_prometheus.value.auto_monitoring_config
            content {
              scope = auto_monitoring_config.value.scope
            }
          }

        }
      }

    }
  }

  dynamic "network_policy" {
    for_each = var.network_policy
    content {
      enabled  = network_policy.value.enabled
      provider = network_policy.value.provider
    }
  }

  dynamic "node_config" {
    for_each = var.node_config
    content {
      boot_disk_kms_key           = node_config.value.boot_disk_kms_key
      disk_size_gb                = node_config.value.disk_size_gb
      disk_type                   = node_config.value.disk_type
      enable_confidential_storage = node_config.value.enable_confidential_storage
      image_type                  = node_config.value.image_type
      labels                      = node_config.value.labels
      local_ssd_count             = node_config.value.local_ssd_count
      local_ssd_encryption_mode   = node_config.value.local_ssd_encryption_mode
      logging_variant             = node_config.value.logging_variant
      machine_type                = node_config.value.machine_type
      max_run_duration            = node_config.value.max_run_duration
      metadata                    = node_config.value.metadata
      min_cpu_platform            = node_config.value.min_cpu_platform
      node_group                  = node_config.value.node_group
      oauth_scopes                = node_config.value.oauth_scopes
      preemptible                 = node_config.value.preemptible
      resource_labels             = node_config.value.resource_labels
      resource_manager_tags       = node_config.value.resource_manager_tags
      service_account             = node_config.value.service_account
      spot                        = node_config.value.spot
      storage_pools               = node_config.value.storage_pools
      tags                        = node_config.value.tags

      dynamic "advanced_machine_features" {
        for_each = node_config.value.advanced_machine_features
        content {
          enable_nested_virtualization = advanced_machine_features.value.enable_nested_virtualization
          threads_per_core             = advanced_machine_features.value.threads_per_core
        }
      }

      dynamic "confidential_nodes" {
        for_each = node_config.value.confidential_nodes
        content {
          enabled = confidential_nodes.value.enabled
        }
      }

      dynamic "containerd_config" {
        for_each = node_config.value.containerd_config
        content {
          dynamic "private_registry_access_config" {
            for_each = containerd_config.value.private_registry_access_config
            content {
              enabled = private_registry_access_config.value.enabled

              dynamic "certificate_authority_domain_config" {
                for_each = private_registry_access_config.value.certificate_authority_domain_config
                content {
                  fqdns = certificate_authority_domain_config.value.fqdns

                  dynamic "gcp_secret_manager_certificate_config" {
                    for_each = certificate_authority_domain_config.value.gcp_secret_manager_certificate_config
                    content {
                      secret_uri = gcp_secret_manager_certificate_config.value.secret_uri
                    }
                  }

                }
              }

            }
          }

        }
      }

      dynamic "ephemeral_storage_local_ssd_config" {
        for_each = node_config.value.ephemeral_storage_local_ssd_config
        content {
          local_ssd_count = ephemeral_storage_local_ssd_config.value.local_ssd_count
        }
      }

      dynamic "fast_socket" {
        for_each = node_config.value.fast_socket
        content {
          enabled = fast_socket.value.enabled
        }
      }

      dynamic "gcfs_config" {
        for_each = node_config.value.gcfs_config
        content {
          enabled = gcfs_config.value.enabled
        }
      }

      dynamic "guest_accelerator" {
        for_each = node_config.value.guest_accelerator
        content {
          count              = guest_accelerator.value.count
          gpu_partition_size = guest_accelerator.value.gpu_partition_size
          type               = guest_accelerator.value.type

          dynamic "gpu_driver_installation_config" {
            for_each = guest_accelerator.value.gpu_driver_installation_config
            content {
              gpu_driver_version = gpu_driver_installation_config.value.gpu_driver_version
            }
          }

          dynamic "gpu_sharing_config" {
            for_each = guest_accelerator.value.gpu_sharing_config
            content {
              gpu_sharing_strategy       = gpu_sharing_config.value.gpu_sharing_strategy
              max_shared_clients_per_gpu = gpu_sharing_config.value.max_shared_clients_per_gpu
            }
          }

        }
      }

      dynamic "gvnic" {
        for_each = node_config.value.gvnic
        content {
          enabled = gvnic.value.enabled
        }
      }

      dynamic "host_maintenance_policy" {
        for_each = node_config.value.host_maintenance_policy
        content {
          maintenance_interval = host_maintenance_policy.value.maintenance_interval
        }
      }

      dynamic "kubelet_config" {
        for_each = node_config.value.kubelet_config
        content {
          allowed_unsafe_sysctls                 = kubelet_config.value.allowed_unsafe_sysctls
          container_log_max_files                = kubelet_config.value.container_log_max_files
          container_log_max_size                 = kubelet_config.value.container_log_max_size
          cpu_cfs_quota                          = kubelet_config.value.cpu_cfs_quota
          cpu_cfs_quota_period                   = kubelet_config.value.cpu_cfs_quota_period
          cpu_manager_policy                     = kubelet_config.value.cpu_manager_policy
          image_gc_high_threshold_percent        = kubelet_config.value.image_gc_high_threshold_percent
          image_gc_low_threshold_percent         = kubelet_config.value.image_gc_low_threshold_percent
          image_maximum_gc_age                   = kubelet_config.value.image_maximum_gc_age
          image_minimum_gc_age                   = kubelet_config.value.image_minimum_gc_age
          insecure_kubelet_readonly_port_enabled = kubelet_config.value.insecure_kubelet_readonly_port_enabled
          pod_pids_limit                         = kubelet_config.value.pod_pids_limit
        }
      }

      dynamic "linux_node_config" {
        for_each = node_config.value.linux_node_config
        content {
          cgroup_mode = linux_node_config.value.cgroup_mode
          sysctls     = linux_node_config.value.sysctls

          dynamic "hugepages_config" {
            for_each = linux_node_config.value.hugepages_config
            content {
              hugepage_size_1g = hugepages_config.value.hugepage_size_1g
              hugepage_size_2m = hugepages_config.value.hugepage_size_2m
            }
          }

        }
      }

      dynamic "local_nvme_ssd_block_config" {
        for_each = node_config.value.local_nvme_ssd_block_config
        content {
          local_ssd_count = local_nvme_ssd_block_config.value.local_ssd_count
        }
      }

      dynamic "reservation_affinity" {
        for_each = node_config.value.reservation_affinity
        content {
          consume_reservation_type = reservation_affinity.value.consume_reservation_type
          key                      = reservation_affinity.value.key
          values                   = reservation_affinity.value.values
        }
      }

      dynamic "secondary_boot_disks" {
        for_each = node_config.value.secondary_boot_disks
        content {
          disk_image = secondary_boot_disks.value.disk_image
          mode       = secondary_boot_disks.value.mode
        }
      }

      dynamic "shielded_instance_config" {
        for_each = node_config.value.shielded_instance_config
        content {
          enable_integrity_monitoring = shielded_instance_config.value.enable_integrity_monitoring
          enable_secure_boot          = shielded_instance_config.value.enable_secure_boot
        }
      }

      dynamic "sole_tenant_config" {
        for_each = node_config.value.sole_tenant_config
        content {
          dynamic "node_affinity" {
            for_each = sole_tenant_config.value.node_affinity
            content {
              key      = node_affinity.value.key
              operator = node_affinity.value.operator
              values   = node_affinity.value.values
            }
          }

        }
      }

      dynamic "taint" {
        for_each = node_config.value.taint
        content {
          effect = taint.value.effect
          key    = taint.value.key
          value  = taint.value.value
        }
      }

      dynamic "windows_node_config" {
        for_each = node_config.value.windows_node_config
        content {
          osversion = windows_node_config.value.osversion
        }
      }

      dynamic "workload_metadata_config" {
        for_each = node_config.value.workload_metadata_config
        content {
          mode = workload_metadata_config.value.mode
        }
      }

    }
  }

  dynamic "node_pool" {
    for_each = var.node_pool
    content {
      initial_node_count = node_pool.value.initial_node_count
      max_pods_per_node  = node_pool.value.max_pods_per_node
      name               = node_pool.value.name
      name_prefix        = node_pool.value.name_prefix
      node_count         = node_pool.value.node_count
      node_locations     = node_pool.value.node_locations
      version            = node_pool.value.version

      dynamic "autoscaling" {
        for_each = node_pool.value.autoscaling
        content {
          location_policy      = autoscaling.value.location_policy
          max_node_count       = autoscaling.value.max_node_count
          min_node_count       = autoscaling.value.min_node_count
          total_max_node_count = autoscaling.value.total_max_node_count
          total_min_node_count = autoscaling.value.total_min_node_count
        }
      }

      dynamic "management" {
        for_each = node_pool.value.management
        content {
          auto_repair  = management.value.auto_repair
          auto_upgrade = management.value.auto_upgrade
        }
      }

      dynamic "network_config" {
        for_each = node_pool.value.network_config
        content {
          create_pod_range     = network_config.value.create_pod_range
          enable_private_nodes = network_config.value.enable_private_nodes
          pod_ipv4_cidr_block  = network_config.value.pod_ipv4_cidr_block
          pod_range            = network_config.value.pod_range

          dynamic "additional_node_network_configs" {
            for_each = network_config.value.additional_node_network_configs
            content {
              network    = additional_node_network_configs.value.network
              subnetwork = additional_node_network_configs.value.subnetwork
            }
          }

          dynamic "additional_pod_network_configs" {
            for_each = network_config.value.additional_pod_network_configs
            content {
              max_pods_per_node   = additional_pod_network_configs.value.max_pods_per_node
              secondary_pod_range = additional_pod_network_configs.value.secondary_pod_range
              subnetwork          = additional_pod_network_configs.value.subnetwork
            }
          }

          dynamic "network_performance_config" {
            for_each = network_config.value.network_performance_config
            content {
              total_egress_bandwidth_tier = network_performance_config.value.total_egress_bandwidth_tier
            }
          }

          dynamic "pod_cidr_overprovision_config" {
            for_each = network_config.value.pod_cidr_overprovision_config
            content {
              disabled = pod_cidr_overprovision_config.value.disabled
            }
          }

        }
      }

      dynamic "node_config" {
        for_each = node_pool.value.node_config
        content {
          boot_disk_kms_key           = node_config.value.boot_disk_kms_key
          disk_size_gb                = node_config.value.disk_size_gb
          disk_type                   = node_config.value.disk_type
          enable_confidential_storage = node_config.value.enable_confidential_storage
          image_type                  = node_config.value.image_type
          labels                      = node_config.value.labels
          local_ssd_count             = node_config.value.local_ssd_count
          local_ssd_encryption_mode   = node_config.value.local_ssd_encryption_mode
          logging_variant             = node_config.value.logging_variant
          machine_type                = node_config.value.machine_type
          max_run_duration            = node_config.value.max_run_duration
          metadata                    = node_config.value.metadata
          min_cpu_platform            = node_config.value.min_cpu_platform
          node_group                  = node_config.value.node_group
          oauth_scopes                = node_config.value.oauth_scopes
          preemptible                 = node_config.value.preemptible
          resource_labels             = node_config.value.resource_labels
          resource_manager_tags       = node_config.value.resource_manager_tags
          service_account             = node_config.value.service_account
          spot                        = node_config.value.spot
          storage_pools               = node_config.value.storage_pools
          tags                        = node_config.value.tags

          dynamic "advanced_machine_features" {
            for_each = node_config.value.advanced_machine_features
            content {
              enable_nested_virtualization = advanced_machine_features.value.enable_nested_virtualization
              threads_per_core             = advanced_machine_features.value.threads_per_core
            }
          }

          dynamic "confidential_nodes" {
            for_each = node_config.value.confidential_nodes
            content {
              enabled = confidential_nodes.value.enabled
            }
          }

          dynamic "containerd_config" {
            for_each = node_config.value.containerd_config
            content {
              dynamic "private_registry_access_config" {
                for_each = containerd_config.value.private_registry_access_config
                content {
                  enabled = private_registry_access_config.value.enabled

                  dynamic "certificate_authority_domain_config" {
                    for_each = private_registry_access_config.value.certificate_authority_domain_config
                    content {
                      fqdns = certificate_authority_domain_config.value.fqdns

                      dynamic "gcp_secret_manager_certificate_config" {
                        for_each = certificate_authority_domain_config.value.gcp_secret_manager_certificate_config
                        content {
                          secret_uri = gcp_secret_manager_certificate_config.value.secret_uri
                        }
                      }

                    }
                  }

                }
              }

            }
          }

          dynamic "ephemeral_storage_local_ssd_config" {
            for_each = node_config.value.ephemeral_storage_local_ssd_config
            content {
              local_ssd_count = ephemeral_storage_local_ssd_config.value.local_ssd_count
            }
          }

          dynamic "fast_socket" {
            for_each = node_config.value.fast_socket
            content {
              enabled = fast_socket.value.enabled
            }
          }

          dynamic "gcfs_config" {
            for_each = node_config.value.gcfs_config
            content {
              enabled = gcfs_config.value.enabled
            }
          }

          dynamic "guest_accelerator" {
            for_each = node_config.value.guest_accelerator
            content {
              count              = guest_accelerator.value.count
              gpu_partition_size = guest_accelerator.value.gpu_partition_size
              type               = guest_accelerator.value.type

              dynamic "gpu_driver_installation_config" {
                for_each = guest_accelerator.value.gpu_driver_installation_config
                content {
                  gpu_driver_version = gpu_driver_installation_config.value.gpu_driver_version
                }
              }

              dynamic "gpu_sharing_config" {
                for_each = guest_accelerator.value.gpu_sharing_config
                content {
                  gpu_sharing_strategy       = gpu_sharing_config.value.gpu_sharing_strategy
                  max_shared_clients_per_gpu = gpu_sharing_config.value.max_shared_clients_per_gpu
                }
              }

            }
          }

          dynamic "gvnic" {
            for_each = node_config.value.gvnic
            content {
              enabled = gvnic.value.enabled
            }
          }

          dynamic "host_maintenance_policy" {
            for_each = node_config.value.host_maintenance_policy
            content {
              maintenance_interval = host_maintenance_policy.value.maintenance_interval
            }
          }

          dynamic "kubelet_config" {
            for_each = node_config.value.kubelet_config
            content {
              allowed_unsafe_sysctls                 = kubelet_config.value.allowed_unsafe_sysctls
              container_log_max_files                = kubelet_config.value.container_log_max_files
              container_log_max_size                 = kubelet_config.value.container_log_max_size
              cpu_cfs_quota                          = kubelet_config.value.cpu_cfs_quota
              cpu_cfs_quota_period                   = kubelet_config.value.cpu_cfs_quota_period
              cpu_manager_policy                     = kubelet_config.value.cpu_manager_policy
              image_gc_high_threshold_percent        = kubelet_config.value.image_gc_high_threshold_percent
              image_gc_low_threshold_percent         = kubelet_config.value.image_gc_low_threshold_percent
              image_maximum_gc_age                   = kubelet_config.value.image_maximum_gc_age
              image_minimum_gc_age                   = kubelet_config.value.image_minimum_gc_age
              insecure_kubelet_readonly_port_enabled = kubelet_config.value.insecure_kubelet_readonly_port_enabled
              pod_pids_limit                         = kubelet_config.value.pod_pids_limit
            }
          }

          dynamic "linux_node_config" {
            for_each = node_config.value.linux_node_config
            content {
              cgroup_mode = linux_node_config.value.cgroup_mode
              sysctls     = linux_node_config.value.sysctls

              dynamic "hugepages_config" {
                for_each = linux_node_config.value.hugepages_config
                content {
                  hugepage_size_1g = hugepages_config.value.hugepage_size_1g
                  hugepage_size_2m = hugepages_config.value.hugepage_size_2m
                }
              }

            }
          }

          dynamic "local_nvme_ssd_block_config" {
            for_each = node_config.value.local_nvme_ssd_block_config
            content {
              local_ssd_count = local_nvme_ssd_block_config.value.local_ssd_count
            }
          }

          dynamic "reservation_affinity" {
            for_each = node_config.value.reservation_affinity
            content {
              consume_reservation_type = reservation_affinity.value.consume_reservation_type
              key                      = reservation_affinity.value.key
              values                   = reservation_affinity.value.values
            }
          }

          dynamic "secondary_boot_disks" {
            for_each = node_config.value.secondary_boot_disks
            content {
              disk_image = secondary_boot_disks.value.disk_image
              mode       = secondary_boot_disks.value.mode
            }
          }

          dynamic "shielded_instance_config" {
            for_each = node_config.value.shielded_instance_config
            content {
              enable_integrity_monitoring = shielded_instance_config.value.enable_integrity_monitoring
              enable_secure_boot          = shielded_instance_config.value.enable_secure_boot
            }
          }

          dynamic "sole_tenant_config" {
            for_each = node_config.value.sole_tenant_config
            content {
              dynamic "node_affinity" {
                for_each = sole_tenant_config.value.node_affinity
                content {
                  key      = node_affinity.value.key
                  operator = node_affinity.value.operator
                  values   = node_affinity.value.values
                }
              }

            }
          }

          dynamic "taint" {
            for_each = node_config.value.taint
            content {
              effect = taint.value.effect
              key    = taint.value.key
              value  = taint.value.value
            }
          }

          dynamic "windows_node_config" {
            for_each = node_config.value.windows_node_config
            content {
              osversion = windows_node_config.value.osversion
            }
          }

          dynamic "workload_metadata_config" {
            for_each = node_config.value.workload_metadata_config
            content {
              mode = workload_metadata_config.value.mode
            }
          }

        }
      }

      dynamic "placement_policy" {
        for_each = node_pool.value.placement_policy
        content {
          policy_name  = placement_policy.value.policy_name
          tpu_topology = placement_policy.value.tpu_topology
          type         = placement_policy.value.type
        }
      }

      dynamic "queued_provisioning" {
        for_each = node_pool.value.queued_provisioning
        content {
          enabled = queued_provisioning.value.enabled
        }
      }

      dynamic "upgrade_settings" {
        for_each = node_pool.value.upgrade_settings
        content {
          max_surge       = upgrade_settings.value.max_surge
          max_unavailable = upgrade_settings.value.max_unavailable
          strategy        = upgrade_settings.value.strategy

          dynamic "blue_green_settings" {
            for_each = upgrade_settings.value.blue_green_settings
            content {
              node_pool_soak_duration = blue_green_settings.value.node_pool_soak_duration

              dynamic "standard_rollout_policy" {
                for_each = blue_green_settings.value.standard_rollout_policy
                content {
                  batch_node_count    = standard_rollout_policy.value.batch_node_count
                  batch_percentage    = standard_rollout_policy.value.batch_percentage
                  batch_soak_duration = standard_rollout_policy.value.batch_soak_duration
                }
              }

            }
          }

        }
      }

    }
  }

  dynamic "node_pool_auto_config" {
    for_each = var.node_pool_auto_config
    content {
      resource_manager_tags = node_pool_auto_config.value.resource_manager_tags

      dynamic "linux_node_config" {
        for_each = node_pool_auto_config.value.linux_node_config
        content {
          cgroup_mode = linux_node_config.value.cgroup_mode
        }
      }

      dynamic "network_tags" {
        for_each = node_pool_auto_config.value.network_tags
        content {
          tags = network_tags.value.tags
        }
      }

      dynamic "node_kubelet_config" {
        for_each = node_pool_auto_config.value.node_kubelet_config
        content {
          insecure_kubelet_readonly_port_enabled = node_kubelet_config.value.insecure_kubelet_readonly_port_enabled
        }
      }

    }
  }

  dynamic "node_pool_defaults" {
    for_each = var.node_pool_defaults
    content {
      dynamic "node_config_defaults" {
        for_each = node_pool_defaults.value.node_config_defaults
        content {
          insecure_kubelet_readonly_port_enabled = node_config_defaults.value.insecure_kubelet_readonly_port_enabled
          logging_variant                        = node_config_defaults.value.logging_variant

          dynamic "containerd_config" {
            for_each = node_config_defaults.value.containerd_config
            content {
              dynamic "private_registry_access_config" {
                for_each = containerd_config.value.private_registry_access_config
                content {
                  enabled = private_registry_access_config.value.enabled

                  dynamic "certificate_authority_domain_config" {
                    for_each = private_registry_access_config.value.certificate_authority_domain_config
                    content {
                      fqdns = certificate_authority_domain_config.value.fqdns

                      dynamic "gcp_secret_manager_certificate_config" {
                        for_each = certificate_authority_domain_config.value.gcp_secret_manager_certificate_config
                        content {
                          secret_uri = gcp_secret_manager_certificate_config.value.secret_uri
                        }
                      }

                    }
                  }

                }
              }

            }
          }

          dynamic "gcfs_config" {
            for_each = node_config_defaults.value.gcfs_config
            content {
              enabled = gcfs_config.value.enabled
            }
          }

        }
      }

    }
  }

  dynamic "notification_config" {
    for_each = var.notification_config
    content {
      dynamic "pubsub" {
        for_each = notification_config.value.pubsub
        content {
          enabled = pubsub.value.enabled
          topic   = pubsub.value.topic

          dynamic "filter" {
            for_each = pubsub.value.filter
            content {
              event_type = filter.value.event_type
            }
          }

        }
      }

    }
  }

  dynamic "private_cluster_config" {
    for_each = var.private_cluster_config
    content {
      enable_private_endpoint     = private_cluster_config.value.enable_private_endpoint
      enable_private_nodes        = private_cluster_config.value.enable_private_nodes
      master_ipv4_cidr_block      = private_cluster_config.value.master_ipv4_cidr_block
      private_endpoint_subnetwork = private_cluster_config.value.private_endpoint_subnetwork

      dynamic "master_global_access_config" {
        for_each = private_cluster_config.value.master_global_access_config
        content {
          enabled = master_global_access_config.value.enabled
        }
      }

    }
  }

  dynamic "release_channel" {
    for_each = var.release_channel
    content {
      channel = release_channel.value.channel
    }
  }

  dynamic "resource_usage_export_config" {
    for_each = var.resource_usage_export_config
    content {
      enable_network_egress_metering       = resource_usage_export_config.value.enable_network_egress_metering
      enable_resource_consumption_metering = resource_usage_export_config.value.enable_resource_consumption_metering

      dynamic "bigquery_destination" {
        for_each = resource_usage_export_config.value.bigquery_destination
        content {
          dataset_id = bigquery_destination.value.dataset_id
        }
      }

    }
  }

  dynamic "secret_manager_config" {
    for_each = var.secret_manager_config
    content {
      enabled = secret_manager_config.value.enabled
    }
  }

  dynamic "security_posture_config" {
    for_each = var.security_posture_config
    content {
      mode               = security_posture_config.value.mode
      vulnerability_mode = security_posture_config.value.vulnerability_mode
    }
  }

  dynamic "service_external_ips_config" {
    for_each = var.service_external_ips_config
    content {
      enabled = service_external_ips_config.value.enabled
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      read   = lookup(timeouts.value, "read", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

  dynamic "user_managed_keys_config" {
    for_each = var.user_managed_keys_config
    content {
      aggregation_ca                    = user_managed_keys_config.value.aggregation_ca
      cluster_ca                        = user_managed_keys_config.value.cluster_ca
      control_plane_disk_encryption_key = user_managed_keys_config.value.control_plane_disk_encryption_key
      etcd_api_ca                       = user_managed_keys_config.value.etcd_api_ca
      etcd_peer_ca                      = user_managed_keys_config.value.etcd_peer_ca
      gkeops_etcd_backup_encryption_key = user_managed_keys_config.value.gkeops_etcd_backup_encryption_key
      service_account_signing_keys      = user_managed_keys_config.value.service_account_signing_keys
      service_account_verification_keys = user_managed_keys_config.value.service_account_verification_keys
    }
  }

  dynamic "vertical_pod_autoscaling" {
    for_each = var.vertical_pod_autoscaling
    content {
      enabled = vertical_pod_autoscaling.value.enabled
    }
  }

  dynamic "workload_identity_config" {
    for_each = var.workload_identity_config
    content {
      workload_pool = workload_identity_config.value.workload_pool
    }
  }

}
