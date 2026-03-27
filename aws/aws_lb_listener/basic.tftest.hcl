variables {
  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-2:123456789012:loadbalancer/app/test-alb/50dc6c495c0c9188"
  port              = 80
  protocol          = "HTTPS"

  tags = {
    "Region"      = "us-east-2"
    "Environment" = "dev"
  }

  type             = "forward"
  target_group_arn = "arn:aws:elasticloadbalancing:us-east-2:123456789012:targetgroup/target-group/1234567890123456"

}

provider "aws" {
  region = "us-east-1"
}


run "validate" {
  command = plan
  assert {
    condition     = aws_lb_listener.this.port == 80
    error_message = "AWS LB listener port is not correct"
  }

}
