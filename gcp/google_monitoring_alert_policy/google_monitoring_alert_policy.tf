resource "google_monitoring_alert_policy" "this" {
  combiner              = var.combiner
  display_name          = var.display_name
  enabled               = var.enabled
  notification_channels = var.notification_channels
  severity              = var.severity
  user_labels           = var.user_labels

  dynamic "alert_strategy" {
    for_each = var.alert_strategy
    content {
      auto_close           = alert_strategy.value.auto_close
      notification_prompts = alert_strategy.value.notification_prompts

      dynamic "notification_channel_strategy" {
        for_each = alert_strategy.value.notification_channel_strategy
        content {
          notification_channel_names = notification_channel_strategy.value.notification_channel_names
          renotify_interval          = notification_channel_strategy.value.renotify_interval
        }
      }

      dynamic "notification_rate_limit" {
        for_each = alert_strategy.value.notification_rate_limit
        content {
          period = notification_rate_limit.value.period
        }
      }

    }
  }

  dynamic "conditions" {
    for_each = var.conditions
    content {
      display_name = conditions.value.display_name

      dynamic "condition_absent" {
        for_each = conditions.value.condition_absent
        content {
          duration = condition_absent.value.duration
          filter   = condition_absent.value.filter

          dynamic "aggregations" {
            for_each = condition_absent.value.aggregations
            content {
              alignment_period     = aggregations.value.alignment_period
              cross_series_reducer = aggregations.value.cross_series_reducer
              group_by_fields      = aggregations.value.group_by_fields
              per_series_aligner   = aggregations.value.per_series_aligner
            }
          }

          dynamic "trigger" {
            for_each = condition_absent.value.trigger
            content {
              count   = trigger.value.count
              percent = trigger.value.percent
            }
          }

        }
      }

      dynamic "condition_matched_log" {
        for_each = conditions.value.condition_matched_log
        content {
          filter           = condition_matched_log.value.filter
          label_extractors = condition_matched_log.value.label_extractors
        }
      }

      dynamic "condition_monitoring_query_language" {
        for_each = conditions.value.condition_monitoring_query_language
        content {
          duration                = condition_monitoring_query_language.value.duration
          evaluation_missing_data = condition_monitoring_query_language.value.evaluation_missing_data
          query                   = condition_monitoring_query_language.value.query

          dynamic "trigger" {
            for_each = condition_monitoring_query_language.value.trigger
            content {
              count   = trigger.value.count
              percent = trigger.value.percent
            }
          }

        }
      }

      dynamic "condition_prometheus_query_language" {
        for_each = conditions.value.condition_prometheus_query_language
        content {
          alert_rule                = condition_prometheus_query_language.value.alert_rule
          disable_metric_validation = condition_prometheus_query_language.value.disable_metric_validation
          duration                  = condition_prometheus_query_language.value.duration
          evaluation_interval       = condition_prometheus_query_language.value.evaluation_interval
          labels                    = condition_prometheus_query_language.value.labels
          query                     = condition_prometheus_query_language.value.query
          rule_group                = condition_prometheus_query_language.value.rule_group
        }
      }

      dynamic "condition_sql" {
        for_each = conditions.value.condition_sql
        content {
          query = condition_sql.value.query

          dynamic "boolean_test" {
            for_each = condition_sql.value.boolean_test
            content {
              column = boolean_test.value.column
            }
          }

          dynamic "daily" {
            for_each = condition_sql.value.daily
            content {
              periodicity = daily.value.periodicity

              dynamic "execution_time" {
                for_each = daily.value.execution_time
                content {
                  hours   = execution_time.value.hours
                  minutes = execution_time.value.minutes
                  nanos   = execution_time.value.nanos
                  seconds = execution_time.value.seconds
                }
              }

            }
          }

          dynamic "hourly" {
            for_each = condition_sql.value.hourly
            content {
              minute_offset = hourly.value.minute_offset
              periodicity   = hourly.value.periodicity
            }
          }

          dynamic "minutes" {
            for_each = condition_sql.value.minutes
            content {
              periodicity = minutes.value.periodicity
            }
          }

          dynamic "row_count_test" {
            for_each = condition_sql.value.row_count_test
            content {
              comparison = row_count_test.value.comparison
              threshold  = row_count_test.value.threshold
            }
          }

        }
      }

      dynamic "condition_threshold" {
        for_each = conditions.value.condition_threshold
        content {
          comparison              = condition_threshold.value.comparison
          denominator_filter      = condition_threshold.value.denominator_filter
          duration                = condition_threshold.value.duration
          evaluation_missing_data = condition_threshold.value.evaluation_missing_data
          filter                  = condition_threshold.value.filter
          threshold_value         = condition_threshold.value.threshold_value

          dynamic "aggregations" {
            for_each = condition_threshold.value.aggregations
            content {
              alignment_period     = aggregations.value.alignment_period
              cross_series_reducer = aggregations.value.cross_series_reducer
              group_by_fields      = aggregations.value.group_by_fields
              per_series_aligner   = aggregations.value.per_series_aligner
            }
          }

          dynamic "denominator_aggregations" {
            for_each = condition_threshold.value.denominator_aggregations
            content {
              alignment_period     = denominator_aggregations.value.alignment_period
              cross_series_reducer = denominator_aggregations.value.cross_series_reducer
              group_by_fields      = denominator_aggregations.value.group_by_fields
              per_series_aligner   = denominator_aggregations.value.per_series_aligner
            }
          }

          dynamic "forecast_options" {
            for_each = condition_threshold.value.forecast_options
            content {
              forecast_horizon = forecast_options.value.forecast_horizon
            }
          }

          dynamic "trigger" {
            for_each = condition_threshold.value.trigger
            content {
              count   = trigger.value.count
              percent = trigger.value.percent
            }
          }

        }
      }

    }
  }

  dynamic "documentation" {
    for_each = var.documentation
    content {
      content   = documentation.value.content
      mime_type = documentation.value.mime_type
      subject   = documentation.value.subject

      dynamic "links" {
        for_each = documentation.value.links
        content {
          display_name = links.value.display_name
          url          = links.value.url
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
