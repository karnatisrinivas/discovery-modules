variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "West US 2"
  resource_group_name   = "example-rg-secondary"
  create_resource_group = "false"
  solution_name         = "solution1"                                                                                                                                         # Required: Name of the solution (e.g., "SecurityCenterFree")
  workspace_name        = "example-log-workspace"                                                                                                                                         # Required: Name of the Log Analytics workspace
  workspace_resource_id = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg-secondary/providers/Microsoft.OperationalInsights/workspaces/example-log-workspace" # Required: Resource ID of the Log Analytics workspace

  # Plan configuration - required
  publisher = "Microsoft"          # Default publisher for most Azure solutions
  product   = "SecurityCenterFree" # Required: Product name (e.g., "OMSGallery/SecurityCenterFree")

  # Optional values with defaults
  tags = {
    environment = "production"
    managed_by  = "terraform"
  }
}

run "deploy_log_analytics_solution" {
  command = plan
  assert {
    condition     = azurerm_log_analytics_solution.this.solution_name == var.solution_name
    error_message = "The Log Analytics solution does not match the expected name."
  }
}
