variables {
  service_name        = "service_name"
  vpc_id              = "vpc_id"
  auto_accept         = false
  policy              = "{}"
  private_dns_enabled = false
  ip_address_type     = "ipv4"
  route_table_ids     = ["rt_id_1", "rt_id_2"]
  subnet_ids          = ["subnet_id_1", "subnet_id_2"]
  security_group_ids  = ["sg_id_1", "sg_id_2"]
  tags                = {}
  vpc_endpoint_type   = "Gateway"

  dns_options = [
    {
      dns_record_ip_type                             = "ipv4"
      private_dns_only_for_inbound_resolver_endpoint = false
    }
  ]

  subnet_configuration = [
    {
      ipv4      = "0.0.0.0"
      ipv6      = null
      subnet_id = "subnet_id_1"
    }
  ]
}

run "test" {
  command = plan
  assert {
    condition     = aws_vpc_endpoint.this.service_name == "service_name"
    error_message = "Test for aws_vpc_endpoint did not pass"
  }
}