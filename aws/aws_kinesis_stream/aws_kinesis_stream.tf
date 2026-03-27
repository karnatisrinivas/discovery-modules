resource "aws_kinesis_stream" "this" {
  name                      = var.name
  shard_count               = var.shard_count
  retention_period          = var.retention_period
  shard_level_metrics       = var.shard_level_metrics
  enforce_consumer_deletion = var.enforce_consumer_deletion
  encryption_type           = var.encryption_type
  dynamic "stream_mode_details" {
    for_each = var.stream_mode_details
    content {
      stream_mode = stream_mode_details.value.stream_mode
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
  kms_key_id = var.kms_key_id
  tags       = var.tags
}

