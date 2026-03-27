resource "azuread_service_principal" "this" {
  client_id                     = var.client_id
  account_enabled               = var.account_enabled
  alternative_names             = var.alternative_names
  description                   = var.description
  login_url                     = var.login_url
  notes                         = var.notes
  notification_email_addresses  = var.notification_email_addresses
  preferred_single_sign_on_mode = var.preferred_single_sign_on_mode
  use_existing                  = var.use_existing
  tags                          = var.tags
  app_role_assignment_required  = var.app_role_assignment_required

  dynamic "feature_tags" {
    for_each = var.feature_tags != null ? [var.feature_tags] : []
    content {
      custom_single_sign_on = feature_tags.value.custom_single_sign_on
      enterprise            = feature_tags.value.enterprise
      gallery               = feature_tags.value.gallery
      hide                  = feature_tags.value.hide
    }
  }

  dynamic "saml_single_sign_on" {
    for_each = var.saml_single_sign_on != null ? [var.saml_single_sign_on] : []
    content {
      relay_state = saml_single_sign_on.value.relay_state
    }
  }
}