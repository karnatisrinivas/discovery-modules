variables {
  region                          = "us-east-1"
  default_route_table_propagation = null
  transit_gateway_cidr_blocks     = []
  default_route_table_association = null
  description                     = null
  dns_support                     = null
  multicast_support               = null
  tags                            = {}
  vpn_ecmp_support                = null
  amazon_side_asn                 = 64512
  auto_accept_shared_attachments  = "disable"
  timeouts                        = [{ default = { create = "10m", delete = "10m", update = "10m" } }]
}

run "test" {
  command = plan
  assert {
    condition     = aws_ec2_transit_gateway.this.amazon_side_asn != null
    error_message = "aws_ec2_transit_gateway was not successful"
  }
}