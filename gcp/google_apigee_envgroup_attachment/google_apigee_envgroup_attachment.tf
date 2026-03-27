resource "google_apigee_envgroup_attachment" "this" {
  envgroup_id = var.envgroup_id
  environment = var.environment

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

}
