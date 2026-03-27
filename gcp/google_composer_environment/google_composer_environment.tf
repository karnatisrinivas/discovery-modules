resource "google_composer_environment" "this" {
  labels = var.labels
  name   = var.name

  dynamic "config" {
    for_each = var.config
    content {
      enable_private_builds_only = config.value.enable_private_builds_only
      enable_private_environment = config.value.enable_private_environment
      environment_size           = config.value.environment_size
      node_count                 = config.value.node_count
      resilience_mode            = config.value.resilience_mode

      dynamic "data_retention_config" {
        for_each = config.value.data_retention_config
        content {
          dynamic "airflow_metadata_retention_config" {
            for_each = data_retention_config.value.airflow_metadata_retention_config
            content {
              retention_days = airflow_metadata_retention_config.value.retention_days
              retention_mode = airflow_metadata_retention_config.value.retention_mode
            }
          }

          dynamic "task_logs_retention_config" {
            for_each = data_retention_config.value.task_logs_retention_config
            content {
              storage_mode = task_logs_retention_config.value.storage_mode
            }
          }

        }
      }

      dynamic "database_config" {
        for_each = config.value.database_config
        content {
          machine_type = database_config.value.machine_type
          zone         = database_config.value.zone
        }
      }

      dynamic "encryption_config" {
        for_each = config.value.encryption_config
        content {
          kms_key_name = encryption_config.value.kms_key_name
        }
      }

      dynamic "maintenance_window" {
        for_each = config.value.maintenance_window
        content {
          end_time   = maintenance_window.value.end_time
          recurrence = maintenance_window.value.recurrence
          start_time = maintenance_window.value.start_time
        }
      }

      dynamic "master_authorized_networks_config" {
        for_each = config.value.master_authorized_networks_config
        content {
          enabled = master_authorized_networks_config.value.enabled

          dynamic "cidr_blocks" {
            for_each = master_authorized_networks_config.value.cidr_blocks
            content {
              cidr_block   = cidr_blocks.value.cidr_block
              display_name = cidr_blocks.value.display_name
            }
          }

        }
      }

      dynamic "node_config" {
        for_each = config.value.node_config
        content {
          composer_internal_ipv4_cidr_block = node_config.value.composer_internal_ipv4_cidr_block
          composer_network_attachment       = node_config.value.composer_network_attachment
          disk_size_gb                      = node_config.value.disk_size_gb
          enable_ip_masq_agent              = node_config.value.enable_ip_masq_agent
          machine_type                      = node_config.value.machine_type
          network                           = node_config.value.network
          oauth_scopes                      = node_config.value.oauth_scopes
          service_account                   = node_config.value.service_account
          subnetwork                        = node_config.value.subnetwork
          tags                              = node_config.value.tags
          zone                              = node_config.value.zone

          dynamic "ip_allocation_policy" {
            for_each = node_config.value.ip_allocation_policy
            content {
              cluster_ipv4_cidr_block       = ip_allocation_policy.value.cluster_ipv4_cidr_block
              cluster_secondary_range_name  = ip_allocation_policy.value.cluster_secondary_range_name
              services_ipv4_cidr_block      = ip_allocation_policy.value.services_ipv4_cidr_block
              services_secondary_range_name = ip_allocation_policy.value.services_secondary_range_name
              use_ip_aliases                = ip_allocation_policy.value.use_ip_aliases
            }
          }

        }
      }

      dynamic "private_environment_config" {
        for_each = config.value.private_environment_config
        content {
          cloud_composer_connection_subnetwork   = private_environment_config.value.cloud_composer_connection_subnetwork
          cloud_composer_network_ipv4_cidr_block = private_environment_config.value.cloud_composer_network_ipv4_cidr_block
          cloud_sql_ipv4_cidr_block              = private_environment_config.value.cloud_sql_ipv4_cidr_block
          connection_type                        = private_environment_config.value.connection_type
          enable_private_endpoint                = private_environment_config.value.enable_private_endpoint
          enable_privately_used_public_ips       = private_environment_config.value.enable_privately_used_public_ips
          master_ipv4_cidr_block                 = private_environment_config.value.master_ipv4_cidr_block
          web_server_ipv4_cidr_block             = private_environment_config.value.web_server_ipv4_cidr_block
        }
      }

      dynamic "recovery_config" {
        for_each = config.value.recovery_config
        content {
          dynamic "scheduled_snapshots_config" {
            for_each = recovery_config.value.scheduled_snapshots_config
            content {
              enabled                    = scheduled_snapshots_config.value.enabled
              snapshot_creation_schedule = scheduled_snapshots_config.value.snapshot_creation_schedule
              snapshot_location          = scheduled_snapshots_config.value.snapshot_location
              time_zone                  = scheduled_snapshots_config.value.time_zone
            }
          }

        }
      }

      dynamic "software_config" {
        for_each = config.value.software_config
        content {
          airflow_config_overrides = software_config.value.airflow_config_overrides
          env_variables            = software_config.value.env_variables
          image_version            = software_config.value.image_version
          pypi_packages            = software_config.value.pypi_packages
          python_version           = software_config.value.python_version
          scheduler_count          = software_config.value.scheduler_count
          web_server_plugins_mode  = software_config.value.web_server_plugins_mode

          dynamic "cloud_data_lineage_integration" {
            for_each = software_config.value.cloud_data_lineage_integration
            content {
              enabled = cloud_data_lineage_integration.value.enabled
            }
          }

        }
      }

      dynamic "web_server_config" {
        for_each = config.value.web_server_config
        content {
          machine_type = web_server_config.value.machine_type
        }
      }

      dynamic "web_server_network_access_control" {
        for_each = config.value.web_server_network_access_control
        content {
          dynamic "allowed_ip_range" {
            for_each = web_server_network_access_control.value.allowed_ip_range
            content {
              description = allowed_ip_range.value.description
              value       = allowed_ip_range.value.value
            }
          }

        }
      }

      dynamic "workloads_config" {
        for_each = config.value.workloads_config
        content {
          dynamic "dag_processor" {
            for_each = workloads_config.value.dag_processor
            content {
              count      = dag_processor.value.count
              cpu        = dag_processor.value.cpu
              memory_gb  = dag_processor.value.memory_gb
              storage_gb = dag_processor.value.storage_gb
            }
          }

          dynamic "scheduler" {
            for_each = workloads_config.value.scheduler
            content {
              count      = scheduler.value.count
              cpu        = scheduler.value.cpu
              memory_gb  = scheduler.value.memory_gb
              storage_gb = scheduler.value.storage_gb
            }
          }

          dynamic "triggerer" {
            for_each = workloads_config.value.triggerer
            content {
              count     = triggerer.value.count
              cpu       = triggerer.value.cpu
              memory_gb = triggerer.value.memory_gb
            }
          }

          dynamic "web_server" {
            for_each = workloads_config.value.web_server
            content {
              cpu        = web_server.value.cpu
              memory_gb  = web_server.value.memory_gb
              storage_gb = web_server.value.storage_gb
            }
          }

          dynamic "worker" {
            for_each = workloads_config.value.worker
            content {
              cpu        = worker.value.cpu
              max_count  = worker.value.max_count
              memory_gb  = worker.value.memory_gb
              min_count  = worker.value.min_count
              storage_gb = worker.value.storage_gb
            }
          }

        }
      }

    }
  }

  dynamic "storage_config" {
    for_each = var.storage_config
    content {
      bucket = storage_config.value.bucket
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
