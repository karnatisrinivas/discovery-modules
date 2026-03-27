locals {
  bindings_map = {
    for i, binding in var.iam_roles : i => binding
  }
}

resource "google_sourcerepo_repository" "this" {
  name = var.name
  pubsub_configs {
    topic                 = var.topic
    message_format        = var.message_format
    service_account_email = var.service_account_email
  }
}

# ============== IAM BINDINGS ==================
resource "google_sourcerepo_repository_iam_member" "binding" {
  for_each = local.bindings_map

  repository = google_sourcerepo_repository.this.name
  role       = each.value.role
  member     = each.value.member
}