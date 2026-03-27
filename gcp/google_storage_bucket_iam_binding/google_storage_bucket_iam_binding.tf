resource "google_storage_bucket_iam_binding" "this" {
  bucket  = var.bucket
  role    = var.role
  members = var.members

  dynamic "condition" {
    for_each = var.condition

    content {
      expression  = condition.value.expression
      title       = condition.value.title
      description = condition.value.description
    }
  }
}