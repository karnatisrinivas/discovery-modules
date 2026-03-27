resource "azurerm_linux_web_app" "this" {
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id

  app_settings                                   = var.app_settings
  client_affinity_enabled                        = var.client_affinity_enabled
  client_certificate_enabled                     = var.client_certificate_enabled
  client_certificate_exclusion_paths             = var.client_certificate_exclusion_paths
  client_certificate_mode                        = var.client_certificate_mode
  enabled                                        = var.enabled
  ftp_publish_basic_authentication_enabled       = var.ftp_publish_basic_authentication_enabled
  https_only                                     = var.https_only
  public_network_access_enabled                  = var.public_network_access_enabled
  tags                                           = var.tags
  virtual_network_subnet_id                      = var.virtual_network_subnet_id
  webdeploy_publish_basic_authentication_enabled = var.webdeploy_publish_basic_authentication_enabled

  dynamic "connection_string" {
    for_each = var.connection_string != null ? var.connection_string : []
    content {
      name  = connection_string.value.name
      type  = connection_string.value.type
      value = connection_string.value.value
    }
  }
  dynamic "site_config" {
    for_each = var.site_config != null ? var.site_config : []
    content {
      always_on                         = site_config.value.always_on
      api_definition_url                = site_config.value.api_definition_url
      api_management_api_id             = site_config.value.api_management_api_id
      app_command_line                  = site_config.value.app_command_line
      default_documents                 = site_config.value.default_documents
      ftps_state                        = site_config.value.ftps_state
      health_check_path                 = site_config.value.health_check_path
      health_check_eviction_time_in_min = site_config.value.health_check_eviction_time_in_min
      http2_enabled                     = site_config.value.http2_enabled
      ip_restriction_default_action     = site_config.value.ip_restriction_default_action
      load_balancing_mode               = site_config.value.load_balancing_mode
      local_mysql_enabled               = site_config.value.local_mysql_enabled
      managed_pipeline_mode             = site_config.value.managed_pipeline_mode
      minimum_tls_version               = site_config.value.minimum_tls_version
      remote_debugging_enabled          = site_config.value.remote_debugging_enabled
      remote_debugging_version          = site_config.value.remote_debugging_version
      use_32_bit_worker                 = site_config.value.use_32_bit_worker
      vnet_route_all_enabled            = site_config.value.vnet_route_all_enabled
      websockets_enabled                = site_config.value.websockets_enabled
      worker_count                      = site_config.value.worker_count

      dynamic "application_stack" {
        for_each = site_config.value.application_stack != null ? site_config.value.application_stack : []
        content {
          docker_image_name        = try(application_stack.value.docker_image_name == "" ? null : application_stack.value.docker_image_name, null)
          docker_registry_url      = try(application_stack.value.docker_registry_url == "" ? null : application_stack.value.docker_registry_url, null)
          docker_registry_username = try(application_stack.value.docker_registry_username == "" ? null : application_stack.value.docker_registry_username, null)
          docker_registry_password = try(application_stack.value.docker_registry_password == "" ? null : application_stack.value.docker_registry_password, null)
          dotnet_version           = try(application_stack.value.dotnet_version == "" ? null : application_stack.value.dotnet_version, null)
          go_version               = try(application_stack.value.go_version == "" ? null : application_stack.value.go_version, null)
          java_server              = try(application_stack.value.java_server == "" ? null : application_stack.value.java_server, null)
          java_server_version      = try(application_stack.value.java_server_version == "" ? null : application_stack.value.java_server_version, null)
          java_version             = try(application_stack.value.java_version == "" ? null : application_stack.value.java_version, null)
          node_version             = try(application_stack.value.node_version == "" ? null : application_stack.value.node_version, null)
          php_version              = try(application_stack.value.php_version == "" ? null : application_stack.value.php_version, null)
          python_version           = try(application_stack.value.python_version == "" ? null : application_stack.value.python_version, null)
          ruby_version             = try(application_stack.value.ruby_version == "" ? null : application_stack.value.ruby_version, null)
        }
      }

      dynamic "ip_restriction" {
        for_each = site_config.value.ip_restriction != null ? site_config.value.ip_restriction : []
        content {
          action                    = ip_restriction.value.action
          ip_address                = ip_restriction.value.ip_address
          name                      = ip_restriction.value.name
          priority                  = ip_restriction.value.priority
          service_tag               = ip_restriction.value.service_tag
          virtual_network_subnet_id = ip_restriction.value.virtual_network_subnet_id
        }
      }
    }
  }

  dynamic "identity" {
    for_each = var.identity != null ? var.identity : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }

  }
}
