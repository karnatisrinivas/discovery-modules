resource "google_apigee_environment" "this" {
  api_proxy_type    = var.api_proxy_type
  deployment_type   = var.deployment_type
  description       = var.description
  display_name      = var.display_name
  forward_proxy_uri = var.forward_proxy_uri
  name              = var.name
  org_id            = var.org_id
  type              = var.type

  dynamic "node_config" {
    for_each = var.node_config
    content {
      max_node_count = node_config.value.max_node_count
      min_node_count = node_config.value.min_node_count
    }
  }

  dynamic "properties" {
    for_each = var.properties
    content {
      dynamic "property" {
        for_each = properties.value.property
        content {
          name  = property.value.name
          value = property.value.value
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
