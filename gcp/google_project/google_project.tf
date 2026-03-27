resource "google_project" "this" {
  auto_create_network = var.auto_create_network
  billing_account     = var.billing_account
  deletion_policy     = var.deletion_policy
  folder_id           = var.folder_id
  labels              = var.labels
  name                = var.name
  org_id              = var.org_id
  project_id          = var.project_id
  tags                = var.tags

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      read   = lookup(timeouts.value, "read", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
