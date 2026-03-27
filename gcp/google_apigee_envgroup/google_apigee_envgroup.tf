resource "google_apigee_envgroup" "this" {
  hostnames = var.hostnames
  name      = var.name
  org_id    = var.org_id

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
