variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"
  # Required inputs - must be provided by user
  name = "example-app-insights" # Required

  # Optional inputs with default values
  application_type = "web" # Default to "web", other options: "ios", "java", "MobileCenter", "Node.JS", "other", "phone"

  # Optional boolean configurations
  disable_ip_masking                  = null # Default: false
  force_customer_storage_for_profiler = null # Default: false
  internet_ingestion_enabled          = null # Default: true
  internet_query_enabled              = null # Default: true
  local_authentication_disabled       = null # Default: false

  # Optional numeric configurations
  retention_in_days   = null # Default: 90
  sampling_percentage = null # Default: 100

  # Optional map and string configurations
  tags         = null # Default: {}
  workspace_id = null # Default: null
}


run "validate" {
  command = apply
  assert {
    condition     = azurerm_application_insights.this.name == var.name
    error_message = "azurerm_application_insights name is not correct"
  }
}
