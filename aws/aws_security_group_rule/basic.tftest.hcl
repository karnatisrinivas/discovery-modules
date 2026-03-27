variables {
  type              = "ingress"
  to_port           = 65535
  from_port         = 0
  protocol          = "tcp"
  security_group_id = "sg-123456"
  description       = "This is a security group rule"
  prefix_list_ids   = ["0.0.0.1"]
  self              = false
}

run "test" {
  command = plan
  assert {
    condition     = aws_security_group_rule.this.security_group_id == "sg-123456"
    error_message = "Test for AWS Security Group Rule did not pass."
  }
}