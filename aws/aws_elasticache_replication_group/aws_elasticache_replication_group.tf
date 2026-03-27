locals {
  engine_version_lookup = {
    "redis" = {
      "7.x" = "7.0"
      "6.x" = "6.2"
    }
  }
}

resource "aws_elasticache_replication_group" "this" {
  automatic_failover_enabled = var.automatic_failover_enabled
  replication_group_id       = var.replication_group_id
  description                = var.description
  apply_immediately          = var.apply_immediately
  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  auth_token                 = var.auth_token != "" ? var.auth_token : null
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  transit_encryption_enabled = var.transit_encryption_enabled
  engine                     = var.engine
  engine_version = try(
    lookup(local.engine_version_lookup[var.engine], var.engine_version, var.engine_version),
    var.engine_version
  )
  auth_token_update_strategy = var.auth_token_update_strategy
  maintenance_window         = var.maintenance_window
  node_type                  = var.node_type
  parameter_group_name       = var.parameter_group_name
  port                       = var.port
  num_cache_clusters         = var.num_cache_clusters
  kms_key_id                 = var.kms_key_id
  tags                       = var.tags
  snapshot_retention_limit   = var.snapshot_retention_limit == 0 ? null : var.snapshot_retention_limit
  multi_az_enabled           = var.multi_az_enabled

  dynamic "log_delivery_configuration" {
    for_each = var.log_delivery_configuration
    content {
      destination      = log_delivery_configuration.value.destination
      destination_type = log_delivery_configuration.value.destination_type
      log_format       = log_delivery_configuration.value.log_format
      log_type         = log_delivery_configuration.value.log_type
    }
  }
}
