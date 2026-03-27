variables {
  min_size                  = 1
  max_size                  = 3
  desired_capacity          = 2
  desired_capacity_type     = "units"
  vpc_zone_identifier       = ["subnet-12345678"]
  suspended_processes       = []
  health_check_type         = "EC2"
  health_check_grace_period = 300
  target_group_arns         = ["arn:aws:elasticloadbalancing:region:account-id:targetgroup/my-target-group"]
  protect_from_scale_in     = false
  tag = [
    {
      key                 = "Name"
      value               = "my-instance"
      propagate_at_launch = true
    },
    {
      key                 = "Environment"
      value               = "dev"
      propagate_at_launch = false
    }
  ]
  launch_template = [{
    id      = "lt-12345678"
    version = "1"
  }]
  launch_configuration = null
  region               = "us-west-2"
  timeouts = {
    delete = null
  }
  max_instance_lifetime            = 0
  capacity_rebalance               = null
  termination_policies             = []
  force_delete                     = null
  force_delete_warm_pool           = null
  ignore_failed_scaling_activities = null
  wait_for_capacity_timeout        = null
  enabled_metrics                  = null
  mixed_instances_policy           = []
}

run "test" {
  command = plan
  assert {
    condition     = aws_autoscaling_group.this.desired_capacity == 2
    error_message = "The test for the AWS EC2 instance did not pass."
  }
}
