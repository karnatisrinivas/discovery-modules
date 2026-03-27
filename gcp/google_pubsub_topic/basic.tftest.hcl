variables {
  name = "pubsub-test"
}

run "test" {
  command = apply

  assert {
    condition     = google_pubsub_topic.this.name == "pubsub-test"
    error_message = "google_pubsub_topic was unsucessful"
  }
}