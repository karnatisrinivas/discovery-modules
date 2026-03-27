variables {
  name                      = "cloud-tasks-queue"
  location                  = "us-west2"
  max_concurrent_dispatches = 3
  max_dispatches_per_second = 2
  max_attempts              = 5
  max_retry_duration        = 4
  iam_roles                 = []
}

run "test" {
  command = apply

  assert {
    condition     = google_cloud_tasks_queue.this.name == "cloud-tasks-queue"
    error_message = "google_cloud_tasks_queue was not successful"
  }
}