resource "azurerm_firewall_policy" "this" {
  auto_learn_private_ranges_enabled = var.auto_learn_private_ranges_enabled
  base_policy_id                    = var.base_policy_id
  location                          = var.location
  name                              = var.name
  private_ip_ranges                 = var.private_ip_ranges
  resource_group_name               = var.resource_group_name
  sku                               = var.sku
  sql_redirect_allowed              = var.sql_redirect_allowed
  tags                              = var.tags
  threat_intelligence_mode          = var.threat_intelligence_mode

  dynamic "dns" {
    for_each = var.dns
    content {
      proxy_enabled = dns.value.proxy_enabled
      servers       = dns.value.servers
    }
  }

  dynamic "explicit_proxy" {
    for_each = var.explicit_proxy
    content {
      enable_pac_file = explicit_proxy.value.enable_pac_file
      enabled         = explicit_proxy.value.enabled
      http_port       = explicit_proxy.value.http_port
      https_port      = explicit_proxy.value.https_port
      pac_file        = explicit_proxy.value.pac_file
      pac_file_port   = explicit_proxy.value.pac_file_port
    }
  }

  dynamic "identity" {
    for_each = var.identity
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "insights" {
    for_each = var.insights
    content {
      default_log_analytics_workspace_id = insights.value.default_log_analytics_workspace_id
      enabled                            = insights.value.enabled
      retention_in_days                  = insights.value.retention_in_days

      dynamic "log_analytics_workspace" {
        for_each = insights.value.log_analytics_workspace
        content {
          firewall_location = log_analytics_workspace.value.firewall_location
          id                = log_analytics_workspace.value.id
        }
      }

    }
  }

  dynamic "intrusion_detection" {
    for_each = var.intrusion_detection
    content {
      mode           = intrusion_detection.value.mode
      private_ranges = intrusion_detection.value.private_ranges

      dynamic "signature_overrides" {
        for_each = intrusion_detection.value.signature_overrides
        content {
          id    = signature_overrides.value.id
          state = signature_overrides.value.state
        }
      }

      dynamic "traffic_bypass" {
        for_each = intrusion_detection.value.traffic_bypass
        content {
          description           = traffic_bypass.value.description
          destination_addresses = traffic_bypass.value.destination_addresses
          destination_ip_groups = traffic_bypass.value.destination_ip_groups
          destination_ports     = traffic_bypass.value.destination_ports
          name                  = traffic_bypass.value.name
          protocol              = traffic_bypass.value.protocol
          source_addresses      = traffic_bypass.value.source_addresses
          source_ip_groups      = traffic_bypass.value.source_ip_groups
        }
      }

    }
  }

  dynamic "threat_intelligence_allowlist" {
    for_each = var.threat_intelligence_allowlist
    content {
      fqdns        = threat_intelligence_allowlist.value.fqdns
      ip_addresses = threat_intelligence_allowlist.value.ip_addresses
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

  dynamic "tls_certificate" {
    for_each = var.tls_certificate
    content {
      key_vault_secret_id = tls_certificate.value.key_vault_secret_id
      name                = tls_certificate.value.name
    }
  }

}
