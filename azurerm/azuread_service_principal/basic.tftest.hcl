variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = false

  client_id                     = "00000000-0000-0000-0000-000000000000"
  account_enabled               = true
  alternative_names             = []
  description                   = ""
  login_url                     = null
  notes                         = ""
  notification_email_addresses  = []
  preferred_single_sign_on_mode = null
  use_existing                  = false
  tags                          = []
  feature_tags                  = null
  saml_single_sign_on           = null

  app_role_assignment_required = false
}

run "test" {
  command = plan

  assert {
    condition     = azuread_service_principal.this.client_id == "00000000-0000-0000-0000-000000000000"
    error_message = "azuread_service_principal was not successful"
  }
}
