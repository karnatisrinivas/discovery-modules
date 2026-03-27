resource "google_secret_manager_secret_iam_member" "this" {
  member    = var.member
  role      = var.role
  secret_id = var.secret_id

  dynamic "condition" {
    for_each = var.condition
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }

}
