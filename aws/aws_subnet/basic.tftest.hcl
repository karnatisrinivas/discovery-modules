variables {
  vpc_id                  = "some_vpc_id"
  cidr_block              = "10.0.0.0/16"
  region                  = "us-east-1"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    "test" = "test"
  }
}

run "validate" {

  command = plan
  assert {
    condition     = aws_subnet.this.cidr_block == "10.0.0.0/16"
    error_message = "AWS Subnet cidr_block is not correct"
  }
}



