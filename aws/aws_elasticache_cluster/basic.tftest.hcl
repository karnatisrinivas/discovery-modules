variables {
  cluster_id           = "example-cluster"
  engine               = "redis"
  node_type            = "cache.m5.large"
  num_cache_nodes      = 1
  parameter_group_name = null
  port                 = null
  subnet_group_name    = null
  security_group_ids   = null
  env                  = "dev"
  region               = "us-east-1"
  tags = {
    Name = "example-cluster"
  }
  az_mode                      = "single-az"
  snapshot_retention_limit     = 1
  auto_minor_version_upgrade   = true
  log_delivery_configuration   = []
  network_type                 = null
  notification_topic_arn       = null
  outpost_mode                 = null
  preferred_availability_zones = []
  preferred_outpost_arn        = null
  replication_group_id         = null
  snapshot_arns                = []
  snapshot_name                = null
  snapshot_window              = null
  transit_encryption_enabled   = false
  ip_discovery                 = null
  maintenance_window           = null
  final_snapshot_identifier    = null
  availability_zone            = null
  timeouts = {
    create = "10m"
    update = "10m"
    delete = "10m"
  }
  apply_immediately = true
  engine_version    = null
}

run "validate" {

  command = apply
  assert {
    condition     = aws_elasticache_cluster.this.cluster_id == "example-cluster"
    error_message = "AWS ElastiCache cluster name is not correct"
  }

}