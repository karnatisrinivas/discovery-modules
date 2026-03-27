resource "google_project_iam_member" "this" {
  project = var.project_id
  role    = var.role
  member  = var.member

  dynamic "condition" {
    for_each = var.condition
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}