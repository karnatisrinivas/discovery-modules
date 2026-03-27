variables {
  apply_immediately          = true
  at_rest_encryption_enabled = true
  replication_group_id       = "someid-1234"
  description                = "my replication group"
  automatic_failover_enabled = true
  auth_token                 = null
  auto_minor_version_upgrade = true
  transit_encryption_enabled = true
  engine                     = null
  engine_version             = null
  auth_token_update_strategy = "ROTATE"
  maintenance_window         = null
  node_type                  = null
  parameter_group_name       = null
  port                       = 6379
  num_cache_clusters         = 2
  kms_key_id                 = null
  tags                       = {}
  log_delivery_configuration = []
  region                     = "us-west-2"
  multi_az_enabled           = false
  snapshot_retention_limit   = 0
}

run "validate" {
  command = plan
  assert {
    condition     = aws_elasticache_replication_group.this.replication_group_id == "someid-1234"
    error_message = "AWS ElastiCache replication group id is not correct"
  }
}