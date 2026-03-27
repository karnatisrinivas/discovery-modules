resource "google_apigee_addons_config" "this" {
  org = var.org

  dynamic "addons_config" {
    for_each = var.addons_config
    content {
      dynamic "advanced_api_ops_config" {
        for_each = addons_config.value.advanced_api_ops_config
        content {
          enabled = advanced_api_ops_config.value.enabled
        }
      }

      dynamic "api_security_config" {
        for_each = addons_config.value.api_security_config
        content {
          enabled = api_security_config.value.enabled
        }
      }

      dynamic "connectors_platform_config" {
        for_each = addons_config.value.connectors_platform_config
        content {
          enabled = connectors_platform_config.value.enabled
        }
      }

      dynamic "integration_config" {
        for_each = addons_config.value.integration_config
        content {
          enabled = integration_config.value.enabled
        }
      }

      dynamic "monetization_config" {
        for_each = addons_config.value.monetization_config
        content {
          enabled = monetization_config.value.enabled
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
