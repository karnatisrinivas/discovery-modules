resource "google_cloudfunctions2_function_iam_member" "this" {
  cloud_function = var.cloud_function
  location       = var.location
  member         = var.member
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
