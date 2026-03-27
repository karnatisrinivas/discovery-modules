resource "google_project_organization_policy" "this" {
  constraint = var.constraint
  project    = var.project_id

  version = var.policy_version

  dynamic "boolean_policy" {
    for_each = var.boolean_policy
    content {
      enforced = boolean_policy.value.enforced
    }
  }

  dynamic "restore_policy" {
    for_each = var.restore_policy
    content {
      default = restore_policy.value.default
    }
  }

  dynamic "list_policy" {
    for_each = var.list_policy
    content {
      suggested_value     = list_policy.value.suggested_value
      inherit_from_parent = list_policy.value.inherit_from_parent

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
}
