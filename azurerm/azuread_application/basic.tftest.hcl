variables {
  subscription_id                = "12345678-1234-9876-4563-123456789012"
  location                       = "East US"
  resource_group_name            = "example-rg"
  create_resource_group          = false
  display_name                   = "test-app"
  fallback_public_client_enabled = false
  identifier_uris                = []
  prevent_duplicate_names        = false
  privacy_statement_url          = ""
  sign_in_audience               = "AzureADMyOrg"
  terms_of_service_url           = ""
  group_membership_claims        = []
  logo_image                     = "SGVsbG8gV29ybGQhIFRoaXMgaXMgYSByYW5kb20gYmFzZTY0IHN0cmluZy4="
  oauth2_post_response_required  = false
  device_only_auth_enabled       = false
  marketing_url                  = ""
  owners                         = []
  support_url                    = ""
  api                            = null
  app_role                       = []
  feature_tags                   = null
  optional_claims                = null
  public_client                  = null
  required_resource_access       = []
  single_page_application        = null
  web                            = null
  notes                          = null
  service_management_reference   = ""
  tags                           = []
  template_id                    = null
}
run "test" {
  command = plan
  assert {
    condition     = azuread_application.this.display_name == "test-app"
    error_message = "azuread_application was not successful"
  }
}
