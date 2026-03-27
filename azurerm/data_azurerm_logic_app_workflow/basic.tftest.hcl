variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  create_resource_group = false
  location              = "East US"
  name                  = "workflow-name"
  resource_group_name   = "example-rg-secondary"
}
run "test" {
  command = plan
  assert {
    condition     = data.azurerm_logic_app_workflow.this.name != null
    error_message = "data.azurerm_logic_app_workflow was not succesful"
  }
}
