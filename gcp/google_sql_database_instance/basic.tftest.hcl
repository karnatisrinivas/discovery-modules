variables {
  name                = "sample-db-tier"
  database_version    = "MYSQL_5_7"
  maintenance_version = "2"

  settings = [
    {
      tier                         = "db-f1-micro"
      edition                      = "ENTERPRISE_PLUS"
      user_labels                  = {}
      activation_policy            = "ALWAYS"
      availability_type            = "REGIONAL"
      collation                    = "collation"
      deletion_protection_enabled  = true
      connector_enforcement        = "REQUIRED"
      enable_google_ml_integration = true
      enable_dataplex_integration  = true
      disk_autoresize              = true
      disk_autoresize_limit        = 0
      disk_size                    = 10
      disk_type                    = "PD_SSD"
      time_zone                    = null

      advanced_machine_features = null
      database_flags = [
        {
          name  = "flag"
          value = "value"
        }
      ]
      active_directory_config = null
      data_cache_config = [
        {
          data_cache_enabled = true
        }
      ]
      deny_maintenance_period = [
        {
          end_date   = "2020-1-01"
          start_date = "2020-1-01"
          time       = "00:00:00"
        }
      ]
      sql_server_audit_config = null
      backup_configuration = [
        {
          binary_log_enabled = true
          enabled            = true
          start_time : "00:00"
          point_in_time_recovery_enabled = false
          location                       = null
          transaction_log_retention_days = 27
          backup_retention_settings = [
            {
              retained_backups = 7
            }
          ]
        }
      ]
      ip_configuration = [
        {
          ipv4_enabled                                  = true
          private_network                               = null
          ssl_mode                                      = "ALLOW_UNENCRYPTED_AND_ENCRYPTED"
          server_ca_mode                                = "GOOGLE_MANAGED_CAS_CA"
          allocated_ip_range                            = "google-managed-services-default"
          enable_private_path_for_google_cloud_services = true
          authorized_networks = [
            {
              expiration_time = null
              name            = "entry"
              value           = "0.0.0.0/0"
            }
          ]
          psc_config = [
            {
              psc_enabled               = true
              allowed_consumer_projects = ["123"]
            }
          ]
        }
      ]
      location_preference = []
      maintenance_window = [
        {
          day          = 5
          hour         = 22
          update_track = "week5"
        }
      ]
      insights_config = [
        {
          query_insights_enabled  = true
          query_string_length     = 4500
          record_application_tags = true
          record_client_address   = true
          query_plans_per_minute  = 20
        }
      ]
      password_validation_policy = [
        {
          min_length                  = 1
          complexity                  = null
          reuse_interval              = 3
          disallow_username_substring = true
          password_change_interval    = 4
          enable_password_policy      = true
        }
      ]
    }
  ]
  replica_configuration  = []
  clone                  = []
  encryption_key_name    = "key"
  root_password          = "123"
  replica_names          = ["replica"]
  master_instance_name   = null
  restore_backup_context = []
}

run "test" {
  command = plan
  assert {
    condition     = google_sql_database_instance.this.name == "sample-db-tier"
    error_message = "SQL Instance did not create successfully"
  }
}