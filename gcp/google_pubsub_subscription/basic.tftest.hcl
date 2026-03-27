variables {
  region                     = "us-central1"
  name                       = "pubsub-test"
  topic                      = "pubsub-test-topic"
  push_config                = []
  ack_deadline_seconds       = 10
  message_retention_duration = 600
  push_endpoint              = "https://example.com/push"
  iam_roles                  = []
}

run "test" {
  command = plan

  assert {
    condition     = google_pubsub_subscription.this.name == "pubsub-test"
    error_message = "google_pubsub_subscription was unsucessful"
  }
}