resource "azurerm_windows_function_app" "this" {
  app_settings                                   = var.app_settings
  builtin_logging_enabled                        = var.builtin_logging_enabled
  client_certificate_enabled                     = var.client_certificate_enabled
  client_certificate_exclusion_paths             = var.client_certificate_exclusion_paths
  client_certificate_mode                        = var.client_certificate_mode
  content_share_force_disabled                   = var.content_share_force_disabled
  daily_memory_time_quota                        = var.daily_memory_time_quota
  enabled                                        = var.enabled
  ftp_publish_basic_authentication_enabled       = var.ftp_publish_basic_authentication_enabled
  functions_extension_version                    = var.functions_extension_version
  https_only                                     = var.https_only
  key_vault_reference_identity_id                = var.key_vault_reference_identity_id
  location                                       = var.location
  name                                           = var.name
  public_network_access_enabled                  = var.public_network_access_enabled
  resource_group_name                            = var.resource_group_name
  service_plan_id                                = var.service_plan_id
  storage_account_access_key                     = var.storage_account_access_key
  storage_account_name                           = var.storage_account_name
  storage_key_vault_secret_id                    = var.storage_key_vault_secret_id
  storage_uses_managed_identity                  = var.storage_uses_managed_identity
  tags                                           = var.tags
  virtual_network_subnet_id                      = var.virtual_network_subnet_id
  webdeploy_publish_basic_authentication_enabled = var.webdeploy_publish_basic_authentication_enabled
  zip_deploy_file                                = var.zip_deploy_file

  dynamic "auth_settings" {
    for_each = var.auth_settings
    content {
      additional_login_parameters    = auth_settings.value.additional_login_parameters
      allowed_external_redirect_urls = auth_settings.value.allowed_external_redirect_urls
      default_provider               = auth_settings.value.default_provider
      enabled                        = auth_settings.value.enabled
      issuer                         = auth_settings.value.issuer
      runtime_version                = auth_settings.value.runtime_version
      token_refresh_extension_hours  = auth_settings.value.token_refresh_extension_hours
      token_store_enabled            = auth_settings.value.token_store_enabled
      unauthenticated_client_action  = auth_settings.value.unauthenticated_client_action

      dynamic "active_directory" {
        for_each = auth_settings.value.active_directory
        content {
          allowed_audiences          = active_directory.value.allowed_audiences
          client_id                  = active_directory.value.client_id
          client_secret              = active_directory.value.client_secret
          client_secret_setting_name = active_directory.value.client_secret_setting_name
        }
      }

      dynamic "facebook" {
        for_each = auth_settings.value.facebook
        content {
          app_id                  = facebook.value.app_id
          app_secret              = facebook.value.app_secret
          app_secret_setting_name = facebook.value.app_secret_setting_name
          oauth_scopes            = facebook.value.oauth_scopes
        }
      }

      dynamic "github" {
        for_each = auth_settings.value.github
        content {
          client_id                  = github.value.client_id
          client_secret              = github.value.client_secret
          client_secret_setting_name = github.value.client_secret_setting_name
          oauth_scopes               = github.value.oauth_scopes
        }
      }

      dynamic "google" {
        for_each = auth_settings.value.google
        content {
          client_id                  = google.value.client_id
          client_secret              = google.value.client_secret
          client_secret_setting_name = google.value.client_secret_setting_name
          oauth_scopes               = google.value.oauth_scopes
        }
      }

      dynamic "microsoft" {
        for_each = auth_settings.value.microsoft
        content {
          client_id                  = microsoft.value.client_id
          client_secret              = microsoft.value.client_secret
          client_secret_setting_name = microsoft.value.client_secret_setting_name
          oauth_scopes               = microsoft.value.oauth_scopes
        }
      }

      dynamic "twitter" {
        for_each = auth_settings.value.twitter
        content {
          consumer_key                 = twitter.value.consumer_key
          consumer_secret              = twitter.value.consumer_secret
          consumer_secret_setting_name = twitter.value.consumer_secret_setting_name
        }
      }

    }
  }

  dynamic "auth_settings_v2" {
    for_each = var.auth_settings_v2
    content {
      auth_enabled                            = auth_settings_v2.value.auth_enabled
      config_file_path                        = auth_settings_v2.value.config_file_path
      default_provider                        = auth_settings_v2.value.default_provider
      excluded_paths                          = auth_settings_v2.value.excluded_paths
      forward_proxy_convention                = auth_settings_v2.value.forward_proxy_convention
      forward_proxy_custom_host_header_name   = auth_settings_v2.value.forward_proxy_custom_host_header_name
      forward_proxy_custom_scheme_header_name = auth_settings_v2.value.forward_proxy_custom_scheme_header_name
      http_route_api_prefix                   = auth_settings_v2.value.http_route_api_prefix
      require_authentication                  = auth_settings_v2.value.require_authentication
      require_https                           = auth_settings_v2.value.require_https
      runtime_version                         = auth_settings_v2.value.runtime_version
      unauthenticated_action                  = auth_settings_v2.value.unauthenticated_action

      dynamic "active_directory_v2" {
        for_each = auth_settings_v2.value.active_directory_v2
        content {
          allowed_applications                 = active_directory_v2.value.allowed_applications
          allowed_audiences                    = active_directory_v2.value.allowed_audiences
          allowed_groups                       = active_directory_v2.value.allowed_groups
          allowed_identities                   = active_directory_v2.value.allowed_identities
          client_id                            = active_directory_v2.value.client_id
          client_secret_certificate_thumbprint = active_directory_v2.value.client_secret_certificate_thumbprint
          client_secret_setting_name           = active_directory_v2.value.client_secret_setting_name
          jwt_allowed_client_applications      = active_directory_v2.value.jwt_allowed_client_applications
          jwt_allowed_groups                   = active_directory_v2.value.jwt_allowed_groups
          login_parameters                     = active_directory_v2.value.login_parameters
          tenant_auth_endpoint                 = active_directory_v2.value.tenant_auth_endpoint
          www_authentication_disabled          = active_directory_v2.value.www_authentication_disabled
        }
      }

      dynamic "apple_v2" {
        for_each = auth_settings_v2.value.apple_v2
        content {
          client_id                  = apple_v2.value.client_id
          client_secret_setting_name = apple_v2.value.client_secret_setting_name
        }
      }

      dynamic "azure_static_web_app_v2" {
        for_each = auth_settings_v2.value.azure_static_web_app_v2
        content {
          client_id = azure_static_web_app_v2.value.client_id
        }
      }

      dynamic "custom_oidc_v2" {
        for_each = auth_settings_v2.value.custom_oidc_v2
        content {
          client_id                     = custom_oidc_v2.value.client_id
          name                          = custom_oidc_v2.value.name
          name_claim_type               = custom_oidc_v2.value.name_claim_type
          openid_configuration_endpoint = custom_oidc_v2.value.openid_configuration_endpoint
          scopes                        = custom_oidc_v2.value.scopes
        }
      }

      dynamic "facebook_v2" {
        for_each = auth_settings_v2.value.facebook_v2
        content {
          app_id                  = facebook_v2.value.app_id
          app_secret_setting_name = facebook_v2.value.app_secret_setting_name
          graph_api_version       = facebook_v2.value.graph_api_version
          login_scopes            = facebook_v2.value.login_scopes
        }
      }

      dynamic "github_v2" {
        for_each = auth_settings_v2.value.github_v2
        content {
          client_id                  = github_v2.value.client_id
          client_secret_setting_name = github_v2.value.client_secret_setting_name
          login_scopes               = github_v2.value.login_scopes
        }
      }

      dynamic "google_v2" {
        for_each = auth_settings_v2.value.google_v2
        content {
          allowed_audiences          = google_v2.value.allowed_audiences
          client_id                  = google_v2.value.client_id
          client_secret_setting_name = google_v2.value.client_secret_setting_name
          login_scopes               = google_v2.value.login_scopes
        }
      }

      dynamic "login" {
        for_each = auth_settings_v2.value.login
        content {
          allowed_external_redirect_urls    = login.value.allowed_external_redirect_urls
          cookie_expiration_convention      = login.value.cookie_expiration_convention
          cookie_expiration_time            = login.value.cookie_expiration_time
          logout_endpoint                   = login.value.logout_endpoint
          nonce_expiration_time             = login.value.nonce_expiration_time
          preserve_url_fragments_for_logins = login.value.preserve_url_fragments_for_logins
          token_refresh_extension_time      = login.value.token_refresh_extension_time
          token_store_enabled               = login.value.token_store_enabled
          token_store_path                  = login.value.token_store_path
          token_store_sas_setting_name      = login.value.token_store_sas_setting_name
          validate_nonce                    = login.value.validate_nonce
        }
      }

      dynamic "microsoft_v2" {
        for_each = auth_settings_v2.value.microsoft_v2
        content {
          allowed_audiences          = microsoft_v2.value.allowed_audiences
          client_id                  = microsoft_v2.value.client_id
          client_secret_setting_name = microsoft_v2.value.client_secret_setting_name
          login_scopes               = microsoft_v2.value.login_scopes
        }
      }

      dynamic "twitter_v2" {
        for_each = auth_settings_v2.value.twitter_v2
        content {
          consumer_key                 = twitter_v2.value.consumer_key
          consumer_secret_setting_name = twitter_v2.value.consumer_secret_setting_name
        }
      }

    }
  }

  dynamic "backup" {
    for_each = var.backup
    content {
      enabled             = backup.value.enabled
      name                = backup.value.name
      storage_account_url = backup.value.storage_account_url

      dynamic "schedule" {
        for_each = backup.value.schedule
        content {
          frequency_interval       = schedule.value.frequency_interval
          frequency_unit           = schedule.value.frequency_unit
          keep_at_least_one_backup = schedule.value.keep_at_least_one_backup
          retention_period_days    = schedule.value.retention_period_days
          start_time               = schedule.value.start_time
        }
      }

    }
  }

  dynamic "connection_string" {
    for_each = var.connection_string
    content {
      name  = connection_string.value.name
      type  = connection_string.value.type
      value = connection_string.value.value
    }
  }

  dynamic "identity" {
    for_each = var.identity
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "site_config" {
    for_each = var.site_config
    content {
      always_on                              = site_config.value.always_on
      api_definition_url                     = site_config.value.api_definition_url
      api_management_api_id                  = site_config.value.api_management_api_id
      app_command_line                       = site_config.value.app_command_line
      app_scale_limit                        = site_config.value.app_scale_limit
      application_insights_connection_string = site_config.value.application_insights_connection_string
      application_insights_key               = site_config.value.application_insights_key
      default_documents                      = site_config.value.default_documents
      elastic_instance_minimum               = site_config.value.elastic_instance_minimum
      ftps_state                             = site_config.value.ftps_state
      health_check_eviction_time_in_min      = site_config.value.health_check_eviction_time_in_min
      health_check_path                      = site_config.value.health_check_path
      http2_enabled                          = site_config.value.http2_enabled
      ip_restriction_default_action          = site_config.value.ip_restriction_default_action
      load_balancing_mode                    = site_config.value.load_balancing_mode
      managed_pipeline_mode                  = site_config.value.managed_pipeline_mode
      minimum_tls_version                    = site_config.value.minimum_tls_version
      pre_warmed_instance_count              = site_config.value.pre_warmed_instance_count
      remote_debugging_enabled               = site_config.value.remote_debugging_enabled
      remote_debugging_version               = site_config.value.remote_debugging_version
      runtime_scale_monitoring_enabled       = site_config.value.runtime_scale_monitoring_enabled
      scm_ip_restriction_default_action      = site_config.value.scm_ip_restriction_default_action
      scm_minimum_tls_version                = site_config.value.scm_minimum_tls_version
      scm_use_main_ip_restriction            = site_config.value.scm_use_main_ip_restriction
      use_32_bit_worker                      = site_config.value.use_32_bit_worker
      vnet_route_all_enabled                 = site_config.value.vnet_route_all_enabled
      websockets_enabled                     = site_config.value.websockets_enabled
      worker_count                           = site_config.value.worker_count

      dynamic "app_service_logs" {
        for_each = site_config.value.app_service_logs
        content {
          disk_quota_mb         = app_service_logs.value.disk_quota_mb
          retention_period_days = app_service_logs.value.retention_period_days
        }
      }

      dynamic "application_stack" {
        for_each = site_config.value.application_stack
        content {
          dotnet_version              = application_stack.value.dotnet_version
          java_version                = application_stack.value.java_version
          node_version                = application_stack.value.node_version
          powershell_core_version     = application_stack.value.powershell_core_version
          use_custom_runtime          = application_stack.value.use_custom_runtime
          use_dotnet_isolated_runtime = application_stack.value.use_dotnet_isolated_runtime
        }
      }

      dynamic "cors" {
        for_each = site_config.value.cors
        content {
          allowed_origins     = cors.value.allowed_origins
          support_credentials = cors.value.support_credentials
        }
      }

      dynamic "ip_restriction" {
        for_each = site_config.value.ip_restriction
        content {
          action                    = ip_restriction.value.action
          description               = ip_restriction.value.description
          headers                   = ip_restriction.value.headers
          ip_address                = ip_restriction.value.ip_address
          name                      = ip_restriction.value.name
          priority                  = ip_restriction.value.priority
          service_tag               = ip_restriction.value.service_tag
          virtual_network_subnet_id = ip_restriction.value.virtual_network_subnet_id
        }
      }

      dynamic "scm_ip_restriction" {
        for_each = site_config.value.scm_ip_restriction
        content {
          action                    = scm_ip_restriction.value.action
          description               = scm_ip_restriction.value.description
          headers                   = scm_ip_restriction.value.headers
          ip_address                = scm_ip_restriction.value.ip_address
          name                      = scm_ip_restriction.value.name
          priority                  = scm_ip_restriction.value.priority
          service_tag               = scm_ip_restriction.value.service_tag
          virtual_network_subnet_id = scm_ip_restriction.value.virtual_network_subnet_id
        }
      }

    }
  }

  dynamic "sticky_settings" {
    for_each = var.sticky_settings
    content {
      app_setting_names       = sticky_settings.value.app_setting_names
      connection_string_names = sticky_settings.value.connection_string_names
    }
  }

  dynamic "storage_account" {
    for_each = var.storage_account
    content {
      access_key   = storage_account.value.access_key
      account_name = storage_account.value.account_name
      mount_path   = storage_account.value.mount_path
      name         = storage_account.value.name
      share_name   = storage_account.value.share_name
      type         = storage_account.value.type
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
