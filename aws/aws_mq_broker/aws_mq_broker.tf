resource "aws_mq_broker" "this" {
  broker_name        = var.broker_name
  engine_type        = var.engine_type
  engine_version     = var.engine_version
  host_instance_type = var.host_instance_type
  dynamic "user" {
    for_each = var.user
    content {
      username         = user.value.username
      password         = user.value.password
      console_access   = user.value.console_access
      groups           = user.value.groups
      replication_user = user.value.replication_user
    }
  }

  apply_immediately       = var.apply_immediately
  authentication_strategy = var.authentication_strategy

  dynamic "configuration" {
    for_each = var.configuration
    content {
      id       = configuration.value.id
      revision = configuration.value.revision
    }
  }

  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  deployment_mode            = var.deployment_mode
  dynamic "encryption_options" {
    for_each = var.encryption_options
    content {
      kms_key_id        = encryption_options.value.kms_key_id
      use_aws_owned_key = encryption_options.value.use_aws_owned_key
    }
  }

  dynamic "ldap_server_metadata" {
    for_each = var.ldap_server_metadata
    content {
      hosts                    = ldap_server_metadata.value.hosts
      role_base                = ldap_server_metadata.value.role_base
      role_name                = ldap_server_metadata.value.role_name
      role_search_matching     = ldap_server_metadata.value.role_search_matching
      role_search_subtree      = ldap_server_metadata.value.role_search_subtree
      service_account_password = ldap_server_metadata.value.service_account_password
      service_account_username = ldap_server_metadata.value.service_account_username
      user_base                = ldap_server_metadata.value.user_base
      user_role_name           = ldap_server_metadata.value.user_role_name
      user_search_matching     = ldap_server_metadata.value.user_search_matching
      user_search_subtree      = ldap_server_metadata.value.user_search_subtree
    }
  }

  dynamic "logs" {
    for_each = var.logs
    content {
      audit   = logs.value.audit
      general = logs.value.general
    }
  }

  dynamic "maintenance_window_start_time" {
    for_each = var.maintenance_window_start_time
    content {
      day_of_week = maintenance_window_start_time.value.day_of_week
      time_of_day = maintenance_window_start_time.value.time_of_day
      time_zone   = maintenance_window_start_time.value.time_zone
    }
  }

  publicly_accessible = var.publicly_accessible
  security_groups     = var.security_groups
  subnet_ids          = var.subnet_ids
  storage_type        = var.storage_type

  tags = var.tags
}

