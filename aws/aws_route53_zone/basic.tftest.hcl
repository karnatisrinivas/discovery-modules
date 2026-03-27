variables {
  name = "test"
  vpc = [{
    vpc_id     = "vpc-12345678"
    vpc_region = "us-west-2"
  }]
  comment           = "test"
  delegation_set_id = null
  force_destroy     = false
  tags = {
    Name = "test"
  }
}

run "test" {
  command = plan
  assert {
    condition     = aws_route53_zone.this.name == "test"
    error_message = "The test for AWS Route Table Zone did not pass"
  }
}
