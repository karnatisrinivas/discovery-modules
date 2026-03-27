resource "azurerm_windows_web_app" "this" {
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
  virtual_network_subnet_id                      = var.virtual_network_subnet_id == "" ? null : var.virtual_network_subnet_id
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
          current_stack                = application_stack.value.current_stack == "" ? null : application_stack.value.current_stack
          docker_image_name            = application_stack.value.docker_image_name == "" ? null : application_stack.value.docker_image_name
          docker_registry_url          = application_stack.value.docker_registry_url == "" ? null : application_stack.value.docker_registry_url
          docker_registry_username     = application_stack.value.docker_registry_username == "" ? null : application_stack.value.docker_registry_username
          docker_registry_password     = application_stack.value.docker_registry_password == "" ? null : application_stack.value.docker_registry_password
          dotnet_version               = application_stack.value.dotnet_version == "" ? null : application_stack.value.dotnet_version
          dotnet_core_version          = application_stack.value.dotnet_core_version == "" ? null : application_stack.value.dotnet_core_version
          tomcat_version               = application_stack.value.tomcat_version == "" ? null : application_stack.value.tomcat_version
          java_embedded_server_enabled = application_stack.value.java_embedded_server_enabled == false ? null : application_stack.value.java_embedded_server_enabled
          java_version                 = application_stack.value.java_version == "" ? null : application_stack.value.java_version
          node_version                 = application_stack.value.node_version == "" ? null : application_stack.value.node_version
          php_version                  = application_stack.value.php_version == "" ? null : application_stack.value.php_version
          python                       = application_stack.value.python
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

      default_documents = site_config.value.default_documents
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
