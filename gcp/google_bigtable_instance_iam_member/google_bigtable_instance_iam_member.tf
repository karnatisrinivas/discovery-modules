resource "google_bigtable_instance_iam_member" "this" {
  instance = var.instance
  member   = var.member
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
