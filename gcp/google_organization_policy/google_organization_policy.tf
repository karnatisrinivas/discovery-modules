resource "google_organization_policy" "this" {
  constraint = var.constraint
  org_id     = var.org_id
  version    = var.google_organization_policy_version

  dynamic "boolean_policy" {
    for_each = var.boolean_policy
    content {
      enforced = boolean_policy.value.enforced
    }
  }

  dynamic "list_policy" {
    for_each = var.list_policy
    content {
      inherit_from_parent = list_policy.value.inherit_from_parent
      suggested_value     = list_policy.value.suggested_value

      dynamic "allow" {
        for_each = list_policy.value.allow
        content {
          all    = allow.value.all
          values = allow.value.values
        }
      }

      dynamic "deny" {
        for_each = list_policy.value.deny
        content {
          all    = deny.value.all
          values = deny.value.values
        }
      }

    }
  }

  dynamic "restore_policy" {
    for_each = var.restore_policy
    content {
      default = restore_policy.value.default
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      read   = lookup(timeouts.value, "read", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
