#tftest.hcl
variables {
  security_group_id = "some_id"
  cidr_ipv4         = "10.0.0.0/16"
  env               = "dev"
  region            = "us-east-1"
  to_port           = 45
  from_port         = 35
  ip_protocol       = "tcp"
  tags = {
    "test" = "test"
  }
}

run "validate" {
  command = plan
  assert {
    condition     = aws_vpc_security_group_egress_rule.this.security_group_id == "some_id"
    error_message = "security group id is not correct"
  }
}
