resource "google_storage_bucket_object" "this" {
  bucket              = var.bucket
  cache_control       = var.cache_control
  content             = var.content
  content_disposition = var.content_disposition
  content_encoding    = var.content_encoding
  content_language    = var.content_language
  content_type        = var.content_type
  detect_md5hash      = var.detect_md5hash
  event_based_hold    = var.event_based_hold
  kms_key_name        = var.kms_key_name
  metadata            = var.metadata
  name                = var.name
  source              = var.google_storage_bucket_object_source
  storage_class       = var.storage_class
  temporary_hold      = var.temporary_hold

  dynamic "customer_encryption" {
    for_each = var.customer_encryption
    content {
      encryption_algorithm = customer_encryption.value.encryption_algorithm
      encryption_key       = customer_encryption.value.encryption_key
    }
  }

  dynamic "retention" {
    for_each = var.retention
    content {
      mode              = retention.value.mode
      retain_until_time = retention.value.retain_until_time
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
