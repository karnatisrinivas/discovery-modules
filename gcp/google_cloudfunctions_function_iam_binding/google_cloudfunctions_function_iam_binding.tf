resource "google_cloudfunctions_function_iam_binding" "this" {
  cloud_function = var.cloud_function
  members        = var.members
  role           = var.role

  dynamic "condition" {
    for_each = var.condition
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }

}
