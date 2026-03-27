variables {
  region             = "us-west-2"
  name               = "test-elb"
  name_prefix        = null
  access_logs        = []
  availability_zones = []
  security_groups    = []
  subnets            = []
  instances          = []
  internal           = null
  listener = [
    {
      instance_port      = 80
      instance_protocol  = "HTTP"
      lb_port            = 80
      lb_protocol        = "HTTP"
      ssl_certificate_id = null
    }
  ]
  health_check              = []
  cross_zone_load_balancing = null
  idle_timeout              = null
  connection_draining       = null
  desync_mitigation_mode    = null
  tags                      = null
}

run "test-elb" {
  command = plan
  assert {
    condition     = aws_elb.this.name == "test-elb"
    error_message = "Expected ELB name to be test-elb"
  }
}
