resource "azurerm_subscription_policy_assignment" "this" {
  description          = var.description
  display_name         = var.display_name
  enforce              = var.enforce
  location             = var.location
  metadata             = var.metadata
  name                 = var.name
  not_scopes           = var.not_scopes
  parameters           = var.parameters
  policy_definition_id = var.policy_definition_id
  subscription_id      = var.subscription_id

  dynamic "identity" {
    for_each = var.identity
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "non_compliance_message" {
    for_each = var.non_compliance_message
    content {
      content                        = non_compliance_message.value.content
      policy_definition_reference_id = non_compliance_message.value.policy_definition_reference_id
    }
  }

  dynamic "overrides" {
    for_each = var.overrides
    content {
      value = overrides.value.value

      dynamic "selectors" {
        for_each = overrides.value.selectors
        content {
          in     = selectors.value.in
          not_in = selectors.value.not_in
        }
      }

    }
  }

  dynamic "resource_selectors" {
    for_each = var.resource_selectors
    content {
      name = resource_selectors.value.name

      dynamic "selectors" {
        for_each = resource_selectors.value.selectors
        content {
          in     = selectors.value.in
          kind   = selectors.value.kind
          not_in = selectors.value.not_in
        }
      }

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
