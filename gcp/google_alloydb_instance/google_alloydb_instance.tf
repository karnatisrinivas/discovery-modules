resource "google_alloydb_instance" "this" {
  annotations       = var.annotations
  availability_type = var.availability_type
  cluster           = var.cluster
  database_flags    = var.database_flags
  display_name      = var.display_name
  gce_zone          = var.gce_zone
  instance_id       = var.instance_id
  instance_type     = var.instance_type
  labels            = var.labels

  dynamic "client_connection_config" {
    for_each = var.client_connection_config
    content {
      require_connectors = client_connection_config.value.require_connectors

      dynamic "ssl_config" {
        for_each = client_connection_config.value.ssl_config
        content {
          ssl_mode = ssl_config.value.ssl_mode
        }
      }

    }
  }

  dynamic "machine_config" {
    for_each = var.machine_config
    content {
      cpu_count = machine_config.value.cpu_count
    }
  }

  dynamic "network_config" {
    for_each = var.network_config
    content {
      enable_outbound_public_ip = network_config.value.enable_outbound_public_ip
      enable_public_ip          = network_config.value.enable_public_ip

      dynamic "authorized_external_networks" {
        for_each = network_config.value.authorized_external_networks
        content {
          cidr_range = authorized_external_networks.value.cidr_range
        }
      }

    }
  }

  dynamic "psc_instance_config" {
    for_each = var.psc_instance_config
    content {
      allowed_consumer_projects = psc_instance_config.value.allowed_consumer_projects

      dynamic "psc_interface_configs" {
        for_each = psc_instance_config.value.psc_interface_configs
        content {
          network_attachment_resource = psc_interface_configs.value.network_attachment_resource
        }
      }

    }
  }

  dynamic "query_insights_config" {
    for_each = var.query_insights_config
    content {
      query_plans_per_minute  = query_insights_config.value.query_plans_per_minute
      query_string_length     = query_insights_config.value.query_string_length
      record_application_tags = query_insights_config.value.record_application_tags
      record_client_address   = query_insights_config.value.record_client_address
    }
  }

  dynamic "read_pool_config" {
    for_each = var.read_pool_config
    content {
      node_count = read_pool_config.value.node_count
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
