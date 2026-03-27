resource "google_bigtable_table" "this" {
  name                = var.name
  instance_name       = var.instance_name
  split_keys          = var.split_keys
  deletion_protection = var.deletion_protection


  dynamic "column_family" {
    for_each = var.column_family
    content {
      family = column_family.value.family
      type   = column_family.value.type
    }
  }

  change_stream_retention = var.change_stream_retention


  dynamic "automated_backup_policy" {
    for_each = var.automated_backup_policy != null ? var.automated_backup_policy : []
    content {
      retention_period = automated_backup_policy.value.retention_period
      frequency        = automated_backup_policy.value.frequency
    }
  }
}