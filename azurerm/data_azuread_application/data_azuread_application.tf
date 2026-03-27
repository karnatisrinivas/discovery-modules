data "azuread_application" "this" {
  client_id      = var.client_id
  display_name   = var.display_name
  identifier_uri = var.identifier_uri
  object_id      = var.object_id

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      read = lookup(timeouts.value, "read", null)
    }
  }

}
