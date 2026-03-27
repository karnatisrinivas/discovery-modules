resource "google_identity_platform_config" "this" {
  authorized_domains         = var.authorized_domains
  autodelete_anonymous_users = var.autodelete_anonymous_users

  dynamic "blocking_functions" {
    for_each = var.blocking_functions
    content {
      dynamic "forward_inbound_credentials" {
        for_each = blocking_functions.value.forward_inbound_credentials
        content {
          access_token  = forward_inbound_credentials.value.access_token
          id_token      = forward_inbound_credentials.value.id_token
          refresh_token = forward_inbound_credentials.value.refresh_token
        }
      }

      dynamic "triggers" {
        for_each = blocking_functions.value.triggers
        content {
          event_type   = triggers.value.event_type
          function_uri = triggers.value.function_uri
        }
      }

    }
  }

  dynamic "client" {
    for_each = var.client
    content {

      dynamic "permissions" {
        for_each = client.value.permissions
        content {
          disabled_user_deletion = permissions.value.disabled_user_deletion
          disabled_user_signup   = permissions.value.disabled_user_signup
        }
      }

    }
  }

  dynamic "mfa" {
    for_each = var.mfa
    content {
      enabled_providers = mfa.value.enabled_providers
      state             = mfa.value.state

      dynamic "provider_configs" {
        for_each = mfa.value.provider_configs
        content {
          state = provider_configs.value.state

          dynamic "totp_provider_config" {
            for_each = provider_configs.value.totp_provider_config
            content {
              adjacent_intervals = totp_provider_config.value.adjacent_intervals
            }
          }

        }
      }

    }
  }

  dynamic "monitoring" {
    for_each = var.monitoring
    content {
      dynamic "request_logging" {
        for_each = monitoring.value.request_logging
        content {
          enabled = request_logging.value.enabled
        }
      }

    }
  }

  dynamic "multi_tenant" {
    for_each = var.multi_tenant
    content {
      allow_tenants           = multi_tenant.value.allow_tenants
      default_tenant_location = multi_tenant.value.default_tenant_location
    }
  }

  dynamic "quota" {
    for_each = var.quota
    content {
      dynamic "sign_up_quota_config" {
        for_each = quota.value.sign_up_quota_config
        content {
          quota          = sign_up_quota_config.value.quota
          quota_duration = sign_up_quota_config.value.quota_duration
          start_time     = sign_up_quota_config.value.start_time
        }
      }

    }
  }

  dynamic "sign_in" {
    for_each = var.sign_in
    content {
      allow_duplicate_emails = sign_in.value.allow_duplicate_emails

      dynamic "anonymous" {
        for_each = sign_in.value.anonymous
        content {
          enabled = anonymous.value.enabled
        }
      }

      dynamic "email" {
        for_each = sign_in.value.email
        content {
          enabled           = email.value.enabled
          password_required = email.value.password_required
        }
      }

      dynamic "phone_number" {
        for_each = sign_in.value.phone_number
        content {
          enabled            = phone_number.value.enabled
          test_phone_numbers = phone_number.value.test_phone_numbers
        }
      }

    }
  }

  dynamic "sms_region_config" {
    for_each = var.sms_region_config
    content {
      dynamic "allow_by_default" {
        for_each = sms_region_config.value.allow_by_default
        content {
          disallowed_regions = allow_by_default.value.disallowed_regions
        }
      }

      dynamic "allowlist_only" {
        for_each = sms_region_config.value.allowlist_only
        content {
          allowed_regions = allowlist_only.value.allowed_regions
        }
      }

    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
