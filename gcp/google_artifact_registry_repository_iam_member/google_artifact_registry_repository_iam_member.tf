resource "google_artifact_registry_repository_iam_member" "this" {
  location   = var.location
  member     = var.member
  repository = var.repository
  role       = var.role

  dynamic "condition" {
    for_each = var.condition
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }

}
