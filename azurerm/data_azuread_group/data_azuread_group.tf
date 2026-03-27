data "azuread_group" "this" {
  display_name               = var.display_name
  include_transitive_members = var.include_transitive_members
  mail_enabled               = var.mail_enabled
  mail_nickname              = var.mail_nickname
  object_id                  = var.object_id
  security_enabled           = var.security_enabled

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      read = lookup(timeouts.value, "read", null)
    }
  }

}
