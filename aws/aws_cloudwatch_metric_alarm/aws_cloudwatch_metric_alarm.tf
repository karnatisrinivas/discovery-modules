resource "aws_cloudwatch_metric_alarm" "this" {
  alarm_name                            = var.alarm_name
  comparison_operator                   = var.comparison_operator
  evaluation_periods                    = var.evaluation_periods
  metric_name                           = var.metric_name == "" ? null : var.metric_name
  namespace                             = var.namespace == "" ? null : var.namespace
  period                                = var.period == 0 ? null : var.period
  statistic                             = var.statistic == "" ? null : var.statistic
  threshold                             = var.threshold == "" ? null : var.threshold
  threshold_metric_id                   = var.threshold_metric_id == "" ? null : var.threshold_metric_id
  actions_enabled                       = var.actions_enabled
  alarm_actions                         = var.alarm_actions
  alarm_description                     = var.alarm_description
  datapoints_to_alarm                   = var.datapoints_to_alarm == 0 ? null : var.datapoints_to_alarm
  dimensions                            = length(var.dimensions) == 0 ? null : var.dimensions
  insufficient_data_actions             = var.insufficient_data_actions
  ok_actions                            = var.ok_actions
  unit                                  = var.unit == "" ? null : var.unit
  extended_statistic                    = var.extended_statistic == "" ? null : var.extended_statistic
  treat_missing_data                    = var.treat_missing_data
  evaluate_low_sample_count_percentiles = var.evaluate_low_sample_count_percentiles == "" ? null : var.evaluate_low_sample_count_percentiles

  dynamic "metric_query" {
    for_each = var.metric_query
    content {
      id          = metric_query.value.id
      account_id  = metric_query.value.account_id == "" ? null : metric_query.value.account_id
      expression  = metric_query.value.expression == "" ? null : metric_query.value.expression
      label       = metric_query.value.label == "" ? null : metric_query.value.label
      period      = metric_query.value.period
      return_data = metric_query.value.return_data
      dynamic "metric" {
        for_each = metric_query.value.metric
        content {
          dimensions  = metric.value.dimensions
          metric_name = metric.value.metric_name
          namespace   = metric.value.namespace
          period      = metric.value.period
          stat        = metric.value.stat
          unit        = metric.value.unit == "" ? "None" : metric.value.unit
        }
      }
    }
  }
  tags = var.tags
}
