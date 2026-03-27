variables {
  region                    = "us-west-2"
  name                      = "test-policy"
  autoscaling_group_name    = "test-group"
  adjustment_type           = ""
  policy_type               = "TargetTrackingScaling"
  estimated_instance_warmup = 300
  enabled                   = true
  min_adjustment_magnitude  = 0
  cooldown                  = 300
  scaling_adjustment        = 0
  metric_aggregation_type   = ""
  step_adjustment           = []
  target_tracking_configuration = [{
    "customized_metric_specification" = []
    "predefined_metric_specification" = [{
      "predefined_metric_type" = "ASGAverageCPUUtilization"
      "resource_label"         = ""
    }]
    "target_value"     = 70
    "disable_scale_in" = false
  }]
  predictive_scaling_configuration = []

}

run "test" {
  command = plan
  assert {
    condition     = aws_autoscaling_policy.this.name == "test-policy"
    error_message = "Policy name should be test-policy"
  }
}