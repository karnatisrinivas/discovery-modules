resource "google_spanner_instance_iam_binding" "this" {
  instance = var.instance
  members  = var.members
  role     = var.role

  dynamic "condition" {
    for_each = var.condition
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }

}
