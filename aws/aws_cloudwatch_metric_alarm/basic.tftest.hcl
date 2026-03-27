variables {
  region                                = "us-west-2"
  alarm_name                            = "example_alarm"
  comparison_operator                   = "GreaterThanOrEqualToThreshold"
  evaluation_periods                    = 2
  metric_name                           = null
  namespace                             = null
  period                                = null
  statistic                             = null
  threshold                             = 80
  actions_enabled                       = true
  alarm_actions                         = []
  alarm_description                     = "This metric monitors ec2 instances"
  datapoints_to_alarm                   = 1
  dimensions                            = {}
  insufficient_data_actions             = []
  ok_actions                            = []
  unit                                  = "Seconds"
  extended_statistic                    = null
  treat_missing_data                    = "missing"
  evaluate_low_sample_count_percentiles = "ignore"
  metric_query = [{
    id          = "example_id"
    account_id  = "example_account_id"
    expression  = "example_expression"
    label       = "example_label"
    period      = 300
    return_data = true
    metric      = []
  }]
  tags                = null
  threshold_metric_id = null
}

run "validate" {
  command = plan
  assert {
    condition     = aws_cloudwatch_metric_alarm.this.alarm_name == "example_alarm"
    error_message = "aws_cloudwatch_metric_alarm name is not correct"
  }

}
