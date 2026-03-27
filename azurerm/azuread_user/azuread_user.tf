resource "azuread_user" "this" {
  display_name        = var.display_name
  user_principal_name = var.user_principal_name

  account_enabled             = var.account_enabled
  age_group                   = var.age_group
  city                        = var.city
  company_name                = var.company_name
  consent_provided_for_minor  = var.consent_provided_for_minor
  cost_center                 = var.cost_center
  country                     = var.country
  department                  = var.department
  disable_password_expiration = var.disable_password_expiration
  disable_strong_password     = var.disable_strong_password
  division                    = var.division
  employee_id                 = var.employee_id
  employee_type               = var.employee_type
  fax_number                  = var.fax_number
  force_password_change       = var.force_password_change
  given_name                  = var.given_name
  job_title                   = var.job_title
  manager_id                  = var.manager_id
  mobile_phone                = var.mobile_phone
  office_location             = var.office_location
  other_mails                 = var.other_mails
  postal_code                 = var.postal_code
  preferred_language          = var.preferred_language
  show_in_address_list        = var.show_in_address_list
  state                       = var.state
  street_address              = var.street_address
  surname                     = var.surname
  usage_location              = var.usage_location
}
