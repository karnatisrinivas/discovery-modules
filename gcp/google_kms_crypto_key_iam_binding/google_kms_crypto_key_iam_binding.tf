resource "google_kms_crypto_key_iam_binding" "this" {
  crypto_key_id = var.crypto_key_id
  role          = var.role
  members       = var.members

  dynamic "condition" {
    for_each = var.condition

    content {
      expression  = condition.value.expression
      title       = condition.value.title
      description = condition.value.description
    }
  }
}