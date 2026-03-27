variables {
  vpc_endpoint_id             = "vpc.id"
  security_group_id           = "sg.id"
  replace_default_association = false
}

run "test" {
  command = plan
  assert {
    condition     = aws_vpc_endpoint_security_group_association.this.vpc_endpoint_id == "vpc.id"
    error_message = "The test for aws_vpc_endpoint_security_group_association did not pass."
  }
}