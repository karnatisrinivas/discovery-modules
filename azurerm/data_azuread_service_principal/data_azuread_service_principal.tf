data "azuread_service_principal" "this" {
  client_id    = var.client_id
  display_name = var.display_name
  object_id    = var.object_id

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      read = lookup(timeouts.value, "read", null)
    }
  }

}
