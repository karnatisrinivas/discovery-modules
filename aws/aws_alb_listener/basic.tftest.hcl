variables {
  load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-2:123456789012:loadbalancer/app/test-alb/50dc6c495c0c9188"
  port              = 80
  protocol          = "HTTP"
  type              = "forward"
  target_group_arn  = "arn:aws:elasticloadbalancing:us-east-2:123456789012:targetgroup/test-tg/644b6b8d5a1c2f7f"
  tags = {
    "Name"        = "dogeapi"
    "Region"      = "us-east-2"
    "Environment" = "dev"
  }

}

provider "aws" {
  region = "us-east-2"
}


run "validate" {
  command = plan
  assert {
    condition     = aws_alb_listener.this.port == 80
    error_message = "AWS ALB Listner port is not correct"
  }
}
