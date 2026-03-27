variables {
  name                         = "test"
  subscription_id              = "12345678-1234-9876-4563-123456789012"
  resource_group_name          = "example-azure-rg"
  location                     = "westus2"
  create_resource_group        = false
  kind                         = "Windows"
  maximum_elastic_worker_count = 0
  sku = [{
    tier     = "Free"
    size     = "F1"
    capacity = 0
  }]
  app_service_environment_id = ""
  reserved                   = false
  per_site_scaling           = false
  is_xenon                   = false
  zone_redundant             = false
  tags                       = {}
  timeouts                   = {}
}

run "test" {
  command = plan
  assert {
    condition     = azurerm_app_service_plan.this.name == "test"
    error_message = "The name of the App Service Plan should be test"
  }
}