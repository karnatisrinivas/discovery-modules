data "google_iam_policy" "this" {
  dynamic "binding" {
    for_each = var.bindings
    content {
      role    = binding.value.role
      members = binding.value.members
      dynamic "condition" {
        for_each = (binding.value.condition_title != null && binding.value.condition_expression != null) ? [1] : []
        content {
          expression  = binding.value.condition_expression
          title       = binding.value.condition_title
          description = binding.value.condition_expression
        }
      }
    }
  }
}