variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "East US"
  resource_group_name   = "example-rg"
  create_resource_group = false

  employee_type               = ""
  street_address              = ""
  surname                     = ""
  usage_location              = ""
  account_enabled             = false
  consent_provided_for_minor  = "Granted"
  job_title                   = ""
  mobile_phone                = ""
  user_principal_name         = "principal-name@example.com"
  city                        = ""
  division                    = ""
  employee_id                 = ""
  preferred_language          = "EN"
  country                     = ""
  disable_strong_password     = false
  fax_number                  = ""
  force_password_change       = false
  display_name                = "test-user"
  age_group                   = "Minor"
  cost_center                 = ""
  other_mails                 = []
  state                       = ""
  disable_password_expiration = false
  given_name                  = ""
  show_in_address_list        = false
  company_name                = ""
  department                  = ""
  manager_id                  = ""
  office_location             = ""
  postal_code                 = ""
}
run "test" {
  command = plan
  assert {
    condition     = azuread_user.this.display_name == "test-user"
    error_message = "azuread_user was not succesful"
  }
}
