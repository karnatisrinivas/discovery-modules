variables {
  transit_gateway_attachment_id                   = "tgw-attach-0123456789abcdefg"
  transit_gateway_default_route_table_association = true
  transit_gateway_default_route_table_propagation = true
  tags = {
    Name = "test"
  }
  region = "us-west-2"
}

run "test" {
  command = plan
  assert {
    condition     = aws_ec2_transit_gateway_vpc_attachment_accepter.this.transit_gateway_attachment_id == "tgw-attach-0123456789abcdefg"
    error_message = "Didn't find expected transit_gateway_attachment_id"
  }
}