resource "google_billing_budget" "this" {
  billing_account = var.billing_account
  display_name    = var.display_name
  ownership_scope = var.ownership_scope

  dynamic "all_updates_rule" {
    for_each = var.all_updates_rule
    content {
      disable_default_iam_recipients   = all_updates_rule.value.disable_default_iam_recipients
      enable_project_level_recipients  = all_updates_rule.value.enable_project_level_recipients
      monitoring_notification_channels = all_updates_rule.value.monitoring_notification_channels
      pubsub_topic                     = all_updates_rule.value.pubsub_topic
      schema_version                   = all_updates_rule.value.schema_version
    }
  }

  dynamic "amount" {
    for_each = var.amount
    content {
      last_period_amount = amount.value.last_period_amount

      dynamic "specified_amount" {
        for_each = amount.value.specified_amount
        content {
          currency_code = specified_amount.value.currency_code
          nanos         = specified_amount.value.nanos
          units         = specified_amount.value.units
        }
      }

    }
  }

  dynamic "budget_filter" {
    for_each = var.budget_filter
    content {
      calendar_period        = budget_filter.value.calendar_period
      credit_types           = budget_filter.value.credit_types
      credit_types_treatment = budget_filter.value.credit_types_treatment
      labels                 = budget_filter.value.labels
      projects               = budget_filter.value.projects
      resource_ancestors     = budget_filter.value.resource_ancestors
      services               = budget_filter.value.services
      subaccounts            = budget_filter.value.subaccounts

      dynamic "custom_period" {
        for_each = budget_filter.value.custom_period
        content {
          dynamic "end_date" {
            for_each = custom_period.value.end_date
            content {
              day   = end_date.value.day
              month = end_date.value.month
              year  = end_date.value.year
            }
          }

          dynamic "start_date" {
            for_each = custom_period.value.start_date
            content {
              day   = start_date.value.day
              month = start_date.value.month
              year  = start_date.value.year
            }
          }

        }
      }

    }
  }

  dynamic "threshold_rules" {
    for_each = var.threshold_rules
    content {
      spend_basis       = threshold_rules.value.spend_basis
      threshold_percent = threshold_rules.value.threshold_percent
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
