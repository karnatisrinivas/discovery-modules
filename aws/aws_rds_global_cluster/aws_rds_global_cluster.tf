resource "aws_rds_global_cluster" "this" {
  database_name                = var.database_name
  deletion_protection          = var.deletion_protection
  engine                       = var.engine
  engine_lifecycle_support     = var.engine_lifecycle_support
  engine_version               = var.engine_version
  force_destroy                = var.force_destroy
  global_cluster_identifier    = var.global_cluster_identifier
  source_db_cluster_identifier = var.source_db_cluster_identifier
  storage_encrypted            = var.storage_encrypted
  tags                         = var.tags

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
