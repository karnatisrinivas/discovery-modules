variables {
  # Required fields with realistic values
  name                 = "func-test-app"
  resource_group_name  = "example-azure-rg"
  location             = "westus2"
  service_plan_id      = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-azure-rg/providers/Microsoft.Web/serverFarms/demo"
  storage_account_name = "examplefnstorageacct"

  # Optional fields with type-specific empty values
  app_settings                                   = {}
  builtin_logging_enabled                        = null
  client_certificate_enabled                     = null
  client_certificate_exclusion_paths             = null
  client_certificate_mode                        = "Optional"
  content_share_force_disabled                   = null
  daily_memory_time_quota                        = null
  enabled                                        = null
  ftp_publish_basic_authentication_enabled       = null
  functions_extension_version                    = "~4"
  https_only                                     = null
  key_vault_reference_identity_id                = null
  public_network_access_enabled                  = null
  storage_account_access_key                     = "dummy-access-key"
  storage_key_vault_secret_id                    = null
  storage_uses_managed_identity                  = null
  tags                                           = {}
  virtual_network_subnet_id                      = null
  webdeploy_publish_basic_authentication_enabled = null
  zip_deploy_file                                = null

  # Nested blocks with empty lists
  auth_settings     = []
  auth_settings_v2  = []
  backup            = []
  connection_string = []
  identity          = []
  sticky_settings   = []
  storage_account   = []

  # Site config with all possible fields
  site_config = [
    {
      always_on                              = null
      api_definition_url                     = null
      api_management_api_id                  = null
      app_command_line                       = null
      app_scale_limit                        = null
      application_insights_connection_string = "InstrumentationKey=00000000-0000-0000-0000-000000000000;IngestionEndpoint=https://westus2-0.in.applicationinsights.azure.com/;LiveEndpoint=https://westus2.livediagnostics.monitor.azure.com/"
      application_insights_key               = "00000000-0000-0000-0000-000000000000"
      default_documents                      = []
      elastic_instance_minimum               = null
      ftps_state                             = "Disabled"
      health_check_eviction_time_in_min      = null
      health_check_path                      = null
      http2_enabled                          = null
      ip_restriction_default_action          = "Allow"
      load_balancing_mode                    = "LeastRequests"
      managed_pipeline_mode                  = "Integrated"
      minimum_tls_version                    = "1.2"
      pre_warmed_instance_count              = null
      remote_debugging_enabled               = null
      remote_debugging_version               = "VS2022"
      runtime_scale_monitoring_enabled       = null
      scm_ip_restriction_default_action      = "Allow"
      scm_minimum_tls_version                = "1.2"
      scm_use_main_ip_restriction            = null
      use_32_bit_worker                      = null
      vnet_route_all_enabled                 = null
      websockets_enabled                     = null
      worker_count                           = null

      # Nested blocks within site_config
      application_stack = [
        {
          dotnet_version              = "v6.0"
          use_dotnet_isolated_runtime = false
          java_version                = null
          node_version                = null
          powershell_core_version     = null
          use_custom_runtime          = null
        }
      ]

      app_service_logs   = []
      cors               = []
      ip_restriction     = []
      scm_ip_restriction = []
    }
  ]

  # Timeouts block
  timeouts = {
    create = "10m"
    delete = "10m"
    read   = "5m"
    update = "10m"
  }
}

run "basic" {
  command = plan

  assert {
    condition     = azurerm_windows_function_app.this.name == var.name
    error_message = "Windows function app name did not match expected value"
  }

  assert {
    condition     = can(regex("^~[234]$", azurerm_windows_function_app.this.functions_extension_version))
    error_message = "Functions extension version should be ~2, ~3, or ~4"
  }
} 