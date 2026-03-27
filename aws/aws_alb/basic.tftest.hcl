variables {
  env                = "cesar"
  region             = "us-east-2"
  name               = "test-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-0a1eeecd978b2d990"]
  subnets = [
    "subnet-0a1eeecd978b2d990",
    "subnet-06a1939485b03e1e8",
    "subnet-0227e2b0abc5f975e"
  ]
  enable_deletion_protection = false
  tags = {
    "Name"        = "dogeapi"
    "Region"      = "us-east-2"
    "Environment" = "dev"
  }
  enable_http2               = false
  access_logs                = []
  idle_timeout               = 60
  drop_invalid_header_fields = false
}

provider "aws" {
  region = var.region
}


run "validate" {
  command = plan
  assert {
    condition     = aws_alb.this.name == "test-alb"
    error_message = "AWS ALB name is not correct"
  }

}
