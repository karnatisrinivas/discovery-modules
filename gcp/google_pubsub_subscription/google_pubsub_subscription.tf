resource "google_pubsub_subscription" "this" {
  name                       = var.name
  topic                      = var.topic
  ack_deadline_seconds       = var.ack_deadline_seconds
  message_retention_duration = var.message_retention_duration

  dynamic "push_config" {
    for_each = var.push_config

    content {
      push_endpoint = push_config.value.push_endpoint
    }
  }
}