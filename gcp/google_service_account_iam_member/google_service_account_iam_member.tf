resource "google_service_account_iam_member" "this" {
  service_account_id = var.service_account_id
  role               = var.role
  member             = var.member

  dynamic "condition" {
    for_each = (var.condition_expression != "" && var.condition_title != "") ? [1] : []
    content {
      expression  = var.condition_expression
      title       = var.condition_title
      description = var.condition_description
    }
  }
}