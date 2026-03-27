variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = false

  end_date             = null
  rotate_when_changed  = {}
  service_principal_id = "/servicePrincipals/servicePrincipalId"
  display_name         = "test-password"
  start_date           = null
}
run "test" {
  command = plan
  assert {
    condition     = azuread_service_principal_password.this.display_name == "test-password"
    error_message = "azuread_service_principal_password was not successful"
  }
}
