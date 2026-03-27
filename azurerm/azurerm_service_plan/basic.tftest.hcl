variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = "false"
  name                  = "example-app-service-plan"

  # Optional inputs with default values
  os_type                    = "Windows" # Common default, but adjust as needed
  sku_name                   = "B1"      # Basic tier as a default
  app_service_environment_id = null
  per_site_scaling_enabled   = false
  zone_balancing_enabled     = false

  # Tags - empty map by default
  tags = {}
}

run "deploy_linux_asp" {
  command = apply
  assert {
    condition     = azurerm_service_plan.this.name == var.name
    error_message = "The App service Plan name does not match the expected name."
  }
}
