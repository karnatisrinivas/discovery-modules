resource "azurerm_mssql_database" "this" {
  auto_pause_delay_in_minutes                                = var.auto_pause_delay_in_minutes
  collation                                                  = var.collation
  create_mode                                                = var.create_mode
  creation_source_database_id                                = var.creation_source_database_id
  elastic_pool_id                                            = var.elastic_pool_id
  enclave_type                                               = var.enclave_type
  geo_backup_enabled                                         = var.geo_backup_enabled
  ledger_enabled                                             = var.ledger_enabled
  license_type                                               = var.license_type
  maintenance_configuration_name                             = var.maintenance_configuration_name
  max_size_gb                                                = var.max_size_gb
  min_capacity                                               = var.min_capacity
  name                                                       = var.name
  read_replica_count                                         = var.read_replica_count
  read_scale                                                 = var.read_scale
  recover_database_id                                        = var.recover_database_id
  recovery_point_id                                          = var.recovery_point_id
  restore_dropped_database_id                                = var.restore_dropped_database_id
  restore_long_term_retention_backup_id                      = var.restore_long_term_retention_backup_id
  restore_point_in_time                                      = var.restore_point_in_time
  sample_name                                                = var.sample_name
  secondary_type                                             = var.secondary_type
  server_id                                                  = var.server_id
  sku_name                                                   = var.sku_name
  storage_account_type                                       = var.storage_account_type
  tags                                                       = var.tags
  transparent_data_encryption_enabled                        = var.transparent_data_encryption_enabled
  transparent_data_encryption_key_automatic_rotation_enabled = var.transparent_data_encryption_key_automatic_rotation_enabled
  transparent_data_encryption_key_vault_key_id               = var.transparent_data_encryption_key_vault_key_id
  zone_redundant                                             = var.zone_redundant

  dynamic "identity" {
    for_each = var.identity
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "import" {
    for_each = var.import
    content {
      administrator_login          = import.value.administrator_login
      administrator_login_password = import.value.administrator_login_password
      authentication_type          = import.value.authentication_type
      storage_account_id           = import.value.storage_account_id
      storage_key                  = import.value.storage_key
      storage_key_type             = import.value.storage_key_type
      storage_uri                  = import.value.storage_uri
    }
  }

  dynamic "long_term_retention_policy" {
    for_each = var.long_term_retention_policy
    content {
      immutable_backups_enabled = long_term_retention_policy.value.immutable_backups_enabled
      monthly_retention         = long_term_retention_policy.value.monthly_retention
      week_of_year              = long_term_retention_policy.value.week_of_year
      weekly_retention          = long_term_retention_policy.value.weekly_retention
      yearly_retention          = long_term_retention_policy.value.yearly_retention
    }
  }

  dynamic "short_term_retention_policy" {
    for_each = var.short_term_retention_policy
    content {
      backup_interval_in_hours = short_term_retention_policy.value.backup_interval_in_hours
      retention_days           = short_term_retention_policy.value.retention_days
    }
  }

  dynamic "threat_detection_policy" {
    for_each = var.threat_detection_policy
    content {
      disabled_alerts            = threat_detection_policy.value.disabled_alerts
      email_account_admins       = threat_detection_policy.value.email_account_admins
      email_addresses            = threat_detection_policy.value.email_addresses
      retention_days             = threat_detection_policy.value.retention_days
      state                      = threat_detection_policy.value.state
      storage_account_access_key = threat_detection_policy.value.storage_account_access_key
      storage_endpoint           = threat_detection_policy.value.storage_endpoint
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      read   = lookup(timeouts.value, "read", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
