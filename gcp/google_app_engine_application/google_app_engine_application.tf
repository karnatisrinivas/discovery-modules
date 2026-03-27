resource "google_app_engine_application" "this" {
  auth_domain    = var.auth_domain
  database_type  = var.database_type
  location_id    = var.location_id
  serving_status = var.serving_status

  dynamic "feature_settings" {
    for_each = var.feature_settings
    content {
      split_health_checks = feature_settings.value.split_health_checks
    }
  }

  dynamic "iap" {
    for_each = var.iap
    content {
      enabled              = iap.value.enabled
      oauth2_client_id     = iap.value.oauth2_client_id
      oauth2_client_secret = iap.value.oauth2_client_secret
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
