resource "aws_storagegateway_tape_pool" "this" {
  pool_name                   = var.pool_name
  retention_lock_time_in_days = var.retention_lock_time_in_days
  retention_lock_type         = var.retention_lock_type
  storage_class               = var.storage_class
  tags                        = var.tags

}
