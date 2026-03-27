variables {
  location              = "eastus2"
  create_resource_group = false
  resource_group_name   = "template-test-group"
  principal_id          = "test-principal-id"
  role_definition_name  = "test-role-definition-name"
  role_definition_id    = null
  scope                 = ""
}


run "validate" {
  command = plan
  assert {
    condition     = azurerm_role_assignment.this.role_definition_name == "test-role-definition-name"
    error_message = "Azure role assignment name is not correct"
  }
}
