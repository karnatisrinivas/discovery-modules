resource "google_pubsub_topic_iam_binding" "this" {
  members = var.members
  role    = var.role
  topic   = var.topic

  dynamic "condition" {
    for_each = var.condition
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }

}
