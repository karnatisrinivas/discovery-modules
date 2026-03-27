resource "google_pubsub_subscription_iam_binding" "this" {
  members      = var.members
  role         = var.role
  subscription = var.subscription

  dynamic "condition" {
    for_each = var.condition
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }

}
