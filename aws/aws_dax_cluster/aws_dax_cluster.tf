resource "aws_dax_cluster" "this" {
  availability_zones               = var.availability_zones
  cluster_endpoint_encryption_type = var.cluster_endpoint_encryption_type
  cluster_name                     = var.cluster_name
  description                      = var.description
  iam_role_arn                     = var.iam_role_arn
  maintenance_window               = var.maintenance_window
  node_type                        = var.node_type
  notification_topic_arn           = var.notification_topic_arn
  parameter_group_name             = var.parameter_group_name
  replication_factor               = var.replication_factor
  security_group_ids               = var.security_group_ids
  subnet_group_name                = var.subnet_group_name
  tags                             = var.tags

  dynamic "server_side_encryption" {
    for_each = var.server_side_encryption
    content {
      enabled = server_side_encryption.value.enabled
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
