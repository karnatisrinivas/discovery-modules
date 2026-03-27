resource "aws_neptune_global_cluster" "this" {
  deletion_protection          = var.deletion_protection
  engine                       = var.engine
  engine_version               = var.engine_version
  global_cluster_identifier    = var.global_cluster_identifier
  source_db_cluster_identifier = var.source_db_cluster_identifier
  storage_encrypted            = var.storage_encrypted

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
