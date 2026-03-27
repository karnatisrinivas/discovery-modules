resource "google_project_default_service_accounts" "this" {
  action         = var.action
  project        = var.project_id
  restore_policy = var.restore_policy

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      read   = lookup(timeouts.value, "read", null)
    }
  }

}
