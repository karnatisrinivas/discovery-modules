resource "google_secret_manager_secret" "this" {
  secret_id = var.secret_id

  dynamic "replication" {
    for_each = var.replication
    content {
      dynamic "auto" {
        for_each = replication.value.auto != null ? replication.value.auto : []
        content {
          dynamic "customer_managed_encryption" {
            for_each = auto.value.customer_managed_encryption != null ? auto.value.customer_managed_encryption : []
            content {
              kms_key_name = customer_managed_encryption.value.kms_key_name
            }
          }
        }
      }

      dynamic "user_managed" {
        for_each = replication.value.user_managed != null ? replication.value.user_managed : []
        content {
          dynamic "replicas" {
            for_each = user_managed.value.replicas
            content {
              location = replicas.value.location
              dynamic "customer_managed_encryption" {
                for_each = replicas.value.customer_managed_encryption != null ? replicas.value.customer_managed_encryption : []
                content {
                  kms_key_name = customer_managed_encryption.value.kms_key_name
                }
              }
            }
          }
        }
      }
    }
  }
}