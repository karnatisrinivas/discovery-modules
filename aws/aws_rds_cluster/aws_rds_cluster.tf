resource "aws_rds_cluster" "this" {
  cluster_identifier = var.cluster_identifier

  # engine settings
  engine         = var.engine
  engine_version = var.engine_version
  engine_mode    = var.engine_mode

  # database settings
  database_name        = var.database_name
  master_username      = var.master_username
  master_password      = var.master_password
  db_subnet_group_name = var.db_subnet_group_name

  # encryption settings
  storage_encrypted       = var.storage_encrypted
  backup_retention_period = var.backup_retention_period
  kms_key_id              = var.kms_key_id

  # cluster settings
  availability_zones           = var.availability_zones
  preferred_backup_window      = var.preferred_backup_window
  preferred_maintenance_window = var.preferred_maintenance_window

  # enable write forwarding
  enable_global_write_forwarding = var.enable_global_write_forwarding == "" ? null : var.enable_global_write_forwarding
  enable_local_write_forwarding  = var.enable_local_write_forwarding == "" ? null : var.enable_local_write_forwarding

  vpc_security_group_ids    = var.vpc_security_group_ids
  global_cluster_identifier = var.global_cluster_identifier
  skip_final_snapshot       = var.skip_final_snapshot
  tags                      = var.tags
  copy_tags_to_snapshot     = var.copy_tags_to_snapshot

  # scaling configuration
  dynamic "scaling_configuration" {
    for_each = var.scaling_configuration
    content {
      auto_pause               = scaling_configuration.value.auto_pause
      max_capacity             = scaling_configuration.value.max_capacity
      min_capacity             = scaling_configuration.value.min_capacity
      seconds_until_auto_pause = scaling_configuration.value.seconds_until_auto_pause
      timeout_action           = scaling_configuration.value.timeout_action
      seconds_before_timeout   = scaling_configuration.value.seconds_before_timeout
    }
  }

  dynamic "serverlessv2_scaling_configuration" {
    for_each = var.serverlessv2_scaling_configuration
    content {
      max_capacity             = serverlessv2_scaling_configuration.value.max_capacity
      min_capacity             = serverlessv2_scaling_configuration.value.min_capacity
      seconds_until_auto_pause = serverlessv2_scaling_configuration.value.seconds_until_auto_pause == 0 ? null : serverlessv2_scaling_configuration.value.seconds_until_auto_pause
    }
  }
  enabled_cloudwatch_logs_exports = var.engine_mode == "serverless" ? null : var.enabled_cloudwatch_logs_exports
}

