resource "google_apigee_environment_iam_member" "this" {
  env_id = var.env_id
  member = var.member
  org_id = var.org_id
  role   = var.role

  dynamic "condition" {
    for_each = var.condition
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }

}
