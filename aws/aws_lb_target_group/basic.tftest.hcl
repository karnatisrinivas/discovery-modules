variables {
  env         = "cesar"
  region      = "us-east-2"
  name        = "test-target-group"
  port        = "80"
  protocol    = "HTTP"
  vpc_id      = "vpc-0e8f3f5e5f3e3e3e3"
  target_type = "ip"
  tags = {
    "Name"        = "dogeapi"
    "Region"      = "us-east-2"
    "Environment" = "dev"
  }

}

provider "aws" {
  region = var.region
}


run "validate" {
  command = plan
  assert {
    condition     = aws_lb_target_group.this.name == "test-target-group"
    error_message = "AWS LB target group name is not correct"
  }
}
