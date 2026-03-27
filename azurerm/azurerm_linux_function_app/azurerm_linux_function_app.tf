resource "azurerm_linux_function_app" "this" {
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id

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
  public_network_access_enabled                  = var.public_network_access_enabled
  storage_account_access_key                     = var.storage_account_access_key
  storage_account_name                           = var.storage_account_name
  storage_key_vault_secret_id                    = var.storage_key_vault_secret_id
  storage_uses_managed_identity                  = var.storage_uses_managed_identity
  tags                                           = var.tags
  virtual_network_subnet_id                      = var.virtual_network_subnet_id
  webdeploy_publish_basic_authentication_enabled = var.webdeploy_publish_basic_authentication_enabled

  dynamic "site_config" {
    for_each = var.site_config != null ? var.site_config : []
    content {
      always_on                                     = site_config.value.always_on
      api_definition_url                            = site_config.value.api_definition_url
      api_management_api_id                         = site_config.value.api_management_api_id
      app_command_line                              = site_config.value.app_command_line
      app_scale_limit                               = site_config.value.app_scale_limit
      application_insights_connection_string        = site_config.value.application_insights_connection_string
      application_insights_key                      = site_config.value.application_insights_key
      container_registry_managed_identity_client_id = site_config.value.container_registry_managed_identity_client_id
      container_registry_use_managed_identity       = site_config.value.container_registry_use_managed_identity
      default_documents                             = site_config.value.default_documents
      elastic_instance_minimum                      = site_config.value.elastic_instance_minimum
      ftps_state                                    = site_config.value.ftps_state
      health_check_eviction_time_in_min             = site_config.value.health_check_eviction_time_in_min
      health_check_path                             = site_config.value.health_check_path
      http2_enabled                                 = site_config.value.http2_enabled
      ip_restriction_default_action                 = site_config.value.ip_restriction_default_action
      load_balancing_mode                           = site_config.value.load_balancing_mode
      managed_pipeline_mode                         = site_config.value.managed_pipeline_mode
      minimum_tls_version                           = site_config.value.minimum_tls_version
      pre_warmed_instance_count                     = site_config.value.pre_warmed_instance_count
      remote_debugging_enabled                      = site_config.value.remote_debugging_enabled
      remote_debugging_version                      = site_config.value.remote_debugging_version
      runtime_scale_monitoring_enabled              = site_config.value.runtime_scale_monitoring_enabled
      scm_ip_restriction_default_action             = site_config.value.scm_ip_restriction_default_action
      scm_minimum_tls_version                       = site_config.value.scm_minimum_tls_version
      scm_use_main_ip_restriction                   = site_config.value.scm_use_main_ip_restriction
      use_32_bit_worker                             = site_config.value.use_32_bit_worker
      vnet_route_all_enabled                        = site_config.value.vnet_route_all_enabled
      websockets_enabled                            = site_config.value.websockets_enabled
      worker_count                                  = site_config.value.worker_count

      dynamic "app_service_logs" {
        for_each = site_config.value.app_service_logs != null ? [site_config.value.app_service_logs] : []
        content {
          disk_quota_mb         = app_service_logs.value.disk_quota_mb
          retention_period_days = app_service_logs.value.retention_period_days
        }
      }

      dynamic "application_stack" {
        for_each = site_config.value.application_stack != null ? [site_config.value.application_stack] : []
        content {
          dotnet_version              = application_stack.value.dotnet_version
          java_version                = application_stack.value.java_version
          node_version                = application_stack.value.node_version
          python_version              = application_stack.value.python_version
          powershell_core_version     = application_stack.value.powershell_core_version
          use_custom_runtime          = application_stack.value.use_custom_runtime
          use_dotnet_isolated_runtime = application_stack.value.use_dotnet_isolated_runtime

          dynamic "docker" {
            for_each = application_stack.value.docker != null ? [application_stack.value.docker] : []
            content {
              image_name        = docker.value.image_name
              image_tag         = docker.value.image_tag
              registry_url      = docker.value.registry_url
              registry_username = docker.value.registry_username
              registry_password = docker.value.registry_password
            }
          }
        }
      }

      dynamic "cors" {
        for_each = site_config.value.cors != null ? [site_config.value.cors] : []
        content {
          allowed_origins     = cors.value.allowed_origins
          support_credentials = cors.value.support_credentials
        }
      }

      dynamic "ip_restriction" {
        for_each = site_config.value.ip_restriction != null ? site_config.value.ip_restriction : []
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
        for_each = site_config.value.scm_ip_restriction != null ? site_config.value.scm_ip_restriction : []
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
}
