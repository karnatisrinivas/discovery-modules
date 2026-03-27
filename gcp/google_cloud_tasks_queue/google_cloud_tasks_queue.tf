locals {
  bindings_map = {
    for i, binding in var.iam_roles : i => binding
  }
}

resource "google_cloud_tasks_queue" "this" {
  name     = var.name
  location = var.location

  retry_config {
    max_attempts       = var.max_attempts
    max_retry_duration = var.max_retry_duration == null ? null : "${var.max_retry_duration}s"
  }

  dynamic "rate_limits" {
    for_each = var.max_concurrent_dispatches != null || var.max_dispatches_per_second != null ? [1] : []

    content {
      max_concurrent_dispatches = var.max_concurrent_dispatches
      max_dispatches_per_second = var.max_dispatches_per_second
    }
  }
}

# ============== IAM BINDINGS ==================
resource "google_cloud_tasks_queue_iam_member" "binding" {
  for_each = local.bindings_map

  name   = google_cloud_tasks_queue.this.name
  role   = each.value.role
  member = each.value.member
}