variables {
  env                = "cesar"
  region             = "us-east-2"
  name               = "test-lb"
  internal           = false
  load_balancer_type = "application"
  security_group     = ["sg-0a1eeecd978b2d990"]
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
  security_groups = ["sg-0a1eeecd978b2d990"]
  enable_http2    = false
  access_logs     = null
}

provider "aws" {
  region = var.region
}


run "validate" {
  command = plan
  assert {
    condition     = aws_lb.this.name == "test-lb"
    error_message = "AWS LB name is not correct"
  }

}
