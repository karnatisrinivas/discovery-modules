variables {
  vpc_id            = "vpc-0123456789abcdefg"
  availability_zone = "us-east-1a"
  amazon_side_asn   = "65534"
  tags = {
    Name = "test"
  }
  region = "us-east-1"
}

run "test" {
  command = plan
  assert {
    condition     = aws_vpn_gateway.this.vpc_id == "vpc-0123456789abcdefg"
    error_message = "Didn't find expected vpc id"
  }
}