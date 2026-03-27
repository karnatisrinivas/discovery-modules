data "azuread_user" "this" {
  employee_id         = var.employee_id
  mail                = var.mail
  mail_nickname       = var.mail_nickname
  object_id           = var.object_id
  user_principal_name = var.user_principal_name

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      read = lookup(timeouts.value, "read", null)
    }
  }

}
