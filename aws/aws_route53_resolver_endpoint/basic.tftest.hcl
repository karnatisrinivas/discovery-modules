variables {
  region                 = "us-west-2"
  name                   = "test"
  direction              = "INBOUND"
  resolver_endpoint_type = "IPV4"
  protocols              = ["DoH"]
  security_group_ids     = ["sg-0123456789abcdefg"]
  ip_address = [
    {
      subnet_id = "subnet-0123456789abcdefg",
      ip        = "192.168.1.1",
      ipv6      = "2001:db8::1"
    },
    {
      subnet_id = "subnet-0123456789abcdefg",
      ip        = "192.168.1.2",
      ipv6      = "2001:db8::2"
    }
  ]
  tags = { test = "test" }
}

run "test" {
  command = plan
  assert {
    condition     = aws_route53_resolver_endpoint.this.name == "test"
    error_message = "The test for AWS Route53 Resolver Endpoint did not pass"
  }
}