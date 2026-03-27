variables {
  name = "demo"
}

run "test" {
  command = plan
  assert {
    condition     = data.azurerm_app_service_plan.this.name == "demo"
    error_message = "The name of the App Service Plan is not correct"
  }
}