resource "google_monitoring_notification_channel" "this" {
  description  = var.description
  display_name = var.display_name
  enabled      = var.enabled
  force_delete = var.force_delete
  labels       = var.labels
  type         = var.type
  user_labels  = var.user_labels

  dynamic "sensitive_labels" {
    for_each = var.sensitive_labels
    content {
      auth_token  = sensitive_labels.value.auth_token
      password    = sensitive_labels.value.password
      service_key = sensitive_labels.value.service_key
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
