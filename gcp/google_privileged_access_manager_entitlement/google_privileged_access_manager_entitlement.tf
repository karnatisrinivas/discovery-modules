resource "google_privileged_access_manager_entitlement" "this" {
  entitlement_id       = var.entitlement_id
  location             = var.location
  max_request_duration = var.max_request_duration
  parent               = var.parent

  dynamic "additional_notification_targets" {
    for_each = var.additional_notification_targets
    content {
      admin_email_recipients     = additional_notification_targets.value.admin_email_recipients
      requester_email_recipients = additional_notification_targets.value.requester_email_recipients
    }
  }

  dynamic "approval_workflow" {
    for_each = var.approval_workflow
    content {
      dynamic "manual_approvals" {
        for_each = approval_workflow.value.manual_approvals
        content {
          require_approver_justification = manual_approvals.value.require_approver_justification

          dynamic "steps" {
            for_each = manual_approvals.value.steps
            content {
              approvals_needed          = steps.value.approvals_needed
              approver_email_recipients = steps.value.approver_email_recipients

              dynamic "approvers" {
                for_each = steps.value.approvers
                content {
                  principals = approvers.value.principals
                }
              }

            }
          }

        }
      }

    }
  }

  dynamic "eligible_users" {
    for_each = var.eligible_users
    content {
      principals = eligible_users.value.principals
    }
  }

  dynamic "privileged_access" {
    for_each = var.privileged_access
    content {
      dynamic "gcp_iam_access" {
        for_each = privileged_access.value.gcp_iam_access
        content {
          resource      = gcp_iam_access.value.resource
          resource_type = gcp_iam_access.value.resource_type

          dynamic "role_bindings" {
            for_each = gcp_iam_access.value.role_bindings
            content {
              condition_expression = role_bindings.value.condition_expression
              role                 = role_bindings.value.role
            }
          }

        }
      }

    }
  }

  dynamic "requester_justification_config" {
    for_each = var.requester_justification_config
    content {
      dynamic "not_mandatory" {
        for_each = requester_justification_config.value.not_mandatory
        content {
        }
      }

      dynamic "unstructured" {
        for_each = requester_justification_config.value.unstructured
        content {
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
