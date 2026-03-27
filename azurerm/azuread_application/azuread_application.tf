resource "azuread_application" "this" {
  display_name     = var.display_name
  identifier_uris  = var.identifier_uris
  owners           = var.owners
  sign_in_audience = var.sign_in_audience

  dynamic "api" {
    for_each = var.api != null ? [var.api] : []
    content {
      known_client_applications      = api.value.known_client_applications
      mapped_claims_enabled          = api.value.mapped_claims_enabled
      requested_access_token_version = api.value.requested_access_token_version

      dynamic "oauth2_permission_scope" {
        for_each = api.value.oauth2_permission_scope
        content {
          admin_consent_description  = oauth2_permission_scope.value.admin_consent_description
          admin_consent_display_name = oauth2_permission_scope.value.admin_consent_display_name
          enabled                    = oauth2_permission_scope.value.enabled
          id                         = oauth2_permission_scope.value.id
          type                       = oauth2_permission_scope.value.type
          user_consent_description   = oauth2_permission_scope.value.user_consent_description
          user_consent_display_name  = oauth2_permission_scope.value.user_consent_display_name
          value                      = oauth2_permission_scope.value.value
        }
      }
    }
  }

  dynamic "app_role" {
    for_each = var.app_role
    content {
      allowed_member_types = app_role.value.allowed_member_types
      description          = app_role.value.description
      display_name         = app_role.value.display_name
      enabled              = app_role.value.enabled
      id                   = app_role.value.id
      value                = app_role.value.value
    }
  }

  dynamic "feature_tags" {
    for_each = var.feature_tags != null ? [var.feature_tags] : []
    content {
      custom_single_sign_on = feature_tags.value.custom_single_sign_on
      enterprise            = feature_tags.value.enterprise
      gallery               = feature_tags.value.gallery
      hide                  = feature_tags.value.hide
    }
  }

  dynamic "optional_claims" {
    for_each = var.optional_claims != null ? [var.optional_claims] : []
    content {
      dynamic "access_token" {
        for_each = optional_claims.value.access_token
        content {
          additional_properties = access_token.value.additional_properties
          essential             = access_token.value.essential
          name                  = access_token.value.name
          source                = access_token.value.source
        }
      }

      dynamic "id_token" {
        for_each = optional_claims.value.id_token
        content {
          additional_properties = id_token.value.additional_properties
          essential             = id_token.value.essential
          name                  = id_token.value.name
          source                = id_token.value.source
        }
      }

      dynamic "saml2_token" {
        for_each = optional_claims.value.saml2_token
        content {
          additional_properties = saml2_token.value.additional_properties
          essential             = saml2_token.value.essential
          name                  = saml2_token.value.name
          source                = saml2_token.value.source
        }
      }
    }
  }

  dynamic "public_client" {
    for_each = var.public_client != null ? [var.public_client] : []
    content {
      redirect_uris = public_client.value.redirect_uris
    }
  }

  dynamic "required_resource_access" {
    for_each = var.required_resource_access
    content {
      resource_app_id = required_resource_access.value.resource_app_id

      dynamic "resource_access" {
        for_each = required_resource_access.value.resource_access
        content {
          id   = resource_access.value.id
          type = resource_access.value.type
        }
      }
    }
  }

  dynamic "single_page_application" {
    for_each = var.single_page_application != null ? [var.single_page_application] : []
    content {
      redirect_uris = single_page_application.value.redirect_uris
    }
  }

  dynamic "web" {
    for_each = var.web != null ? [var.web] : []
    content {
      homepage_url  = web.value.homepage_url
      logout_url    = web.value.logout_url
      redirect_uris = web.value.redirect_uris

      dynamic "implicit_grant" {
        for_each = web.value.implicit_grant != null ? [web.value.implicit_grant] : []
        content {
          access_token_issuance_enabled = implicit_grant.value.access_token_issuance_enabled
          id_token_issuance_enabled     = implicit_grant.value.id_token_issuance_enabled
        }
      }
    }
  }

  group_membership_claims        = var.group_membership_claims
  fallback_public_client_enabled = var.fallback_public_client_enabled
  logo_image                     = var.logo_image
  marketing_url                  = var.marketing_url
  notes                          = var.notes
  privacy_statement_url          = var.privacy_statement_url
  service_management_reference   = var.service_management_reference
  support_url                    = var.support_url
  tags                           = var.tags
  template_id                    = var.template_id
  terms_of_service_url           = var.terms_of_service_url
}