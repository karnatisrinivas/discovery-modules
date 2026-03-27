resource "aws_eks_cluster" "this" {
  name                          = var.name
  role_arn                      = var.role_arn
  tags                          = var.tags
  version                       = var.eks_version
  enabled_cluster_log_types     = var.enabled_cluster_log_types
  bootstrap_self_managed_addons = var.bootstrap_self_managed_addons

  dynamic "vpc_config" {
    for_each = var.vpc_config != null ? var.vpc_config : []
    content {
      endpoint_private_access = vpc_config.value.endpoint_private_access
      endpoint_public_access  = vpc_config.value.endpoint_public_access
      public_access_cidrs     = vpc_config.value.public_access_cidrs
      subnet_ids              = vpc_config.value.subnet_ids
      security_group_ids      = vpc_config.value.security_group_ids
    }
  }
  dynamic "access_config" {
    for_each = var.access_config
    content {
      authentication_mode                         = access_config.value.authentication_mode
      bootstrap_cluster_creator_admin_permissions = access_config.value.bootstrap_cluster_creator_admin_permissions
    }
  }

  dynamic "encryption_config" {
    for_each = var.encryption_config
    content {
      dynamic "provider" {
        for_each = encryption_config.value.provider
        content {
          key_arn = provider.value.key_arn
        }
      }
      resources = encryption_config.value.resources
    }
  }

  dynamic "kubernetes_network_config" {
    for_each = var.kubernetes_network_config
    content {
      dynamic "elastic_load_balancing" {
        for_each = kubernetes_network_config.value.elastic_load_balancing == null ? [] : kubernetes_network_config.value.elastic_load_balancing
        content {
          enabled = elastic_load_balancing.value.enabled
        }
      }
      service_ipv4_cidr = kubernetes_network_config.value.service_ipv4_cidr
      ip_family         = kubernetes_network_config.value.ip_family
    }
  }

  dynamic "outpost_config" {
    for_each = var.outpost_config
    content {
      control_plane_instance_type = outpost_config.value.control_plane_instance_type
      outpost_arns                = outpost_config.value.outpost_arns

      dynamic "control_plane_placement" {
        for_each = outpost_config.value.control_plane_placement
        content {
          group_name = control_plane_placement.value.group_name
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

  dynamic "compute_config" {
    for_each = var.compute_config
    content {
      enabled       = compute_config.value.enabled
      node_pools    = compute_config.value.node_pools
      node_role_arn = compute_config.value.node_role_arn
    }
  }

  dynamic "storage_config" {
    for_each = var.storage_config
    content {
      dynamic "block_storage" {
        for_each = storage_config.value.block_storage
        content {
          enabled = block_storage.value.enabled
        }
      }
    }
  }

  dynamic "remote_network_config" {
    for_each = var.remote_network_config != null ? var.remote_network_config : []
    content {
      dynamic "remote_node_networks" {
        for_each = remote_network_config.value.remote_node_networks
        content {
          cidrs = remote_node_networks.value.cidrs
        }
      }
      dynamic "remote_pod_networks" {
        for_each = remote_network_config.value.remote_pod_networks != null ? remote_network_config.value.remote_pod_networks : []
        content {
          cidrs = remote_pod_networks.value.cidrs
        }
      }
    }
  }

  dynamic "upgrade_policy" {
    for_each = var.upgrade_policy != null ? var.upgrade_policy : []
    content {
      support_type = upgrade_policy.value.support_type
    }
  }

  dynamic "zonal_shift_config" {
    for_each = var.zonal_shift_config
    content {
      enabled = zonal_shift_config.value.enabled
    }
  }
}
