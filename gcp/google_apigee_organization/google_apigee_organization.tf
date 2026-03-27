resource "google_apigee_organization" "this" {
  analytics_region                      = var.analytics_region
  api_consumer_data_encryption_key_name = var.api_consumer_data_encryption_key_name
  api_consumer_data_location            = var.api_consumer_data_location
  authorized_network                    = var.authorized_network
  billing_type                          = var.billing_type
  control_plane_encryption_key_name     = var.control_plane_encryption_key_name
  description                           = var.description
  disable_vpc_peering                   = var.disable_vpc_peering
  display_name                          = var.display_name
  project_id                            = var.project_id
  retention                             = var.retention
  runtime_database_encryption_key_name  = var.runtime_database_encryption_key_name
  runtime_type                          = var.runtime_type

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
