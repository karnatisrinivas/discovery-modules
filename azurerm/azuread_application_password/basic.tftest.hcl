variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = false

  application_id      = "/applications/applicationId"
  display_name        = "test-password"
  end_date            = null
  start_date          = null
  rotate_when_changed = {}
}

run "test" {
  command = plan

  assert {
    condition     = azuread_application_password.this.display_name == "test-password"
    error_message = "azuread_application_password was not successful"
  }
}
