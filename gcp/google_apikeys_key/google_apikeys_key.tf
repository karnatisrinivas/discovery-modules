resource "google_apikeys_key" "this" {
  display_name          = var.display_name
  name                  = var.name
  service_account_email = var.service_account_email

  dynamic "restrictions" {
    for_each = var.restrictions
    content {
      dynamic "android_key_restrictions" {
        for_each = restrictions.value.android_key_restrictions
        content {
          dynamic "allowed_applications" {
            for_each = android_key_restrictions.value.allowed_applications
            content {
              package_name     = allowed_applications.value.package_name
              sha1_fingerprint = allowed_applications.value.sha1_fingerprint
            }
          }

        }
      }

      dynamic "api_targets" {
        for_each = restrictions.value.api_targets
        content {
          methods = api_targets.value.methods
          service = api_targets.value.service
        }
      }

      dynamic "browser_key_restrictions" {
        for_each = restrictions.value.browser_key_restrictions
        content {
          allowed_referrers = browser_key_restrictions.value.allowed_referrers
        }
      }

      dynamic "ios_key_restrictions" {
        for_each = restrictions.value.ios_key_restrictions
        content {
          allowed_bundle_ids = ios_key_restrictions.value.allowed_bundle_ids
        }
      }

      dynamic "server_key_restrictions" {
        for_each = restrictions.value.server_key_restrictions
        content {
          allowed_ips = server_key_restrictions.value.allowed_ips
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
