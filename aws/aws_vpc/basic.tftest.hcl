#tftest.hcl
variables {
  cidr_block                           = "10.0.0.0/16"
  env                                  = "dev"
  region                               = "us-east-1"
  instance_tenancy                     = "default"
  enable_dns_support                   = "false"
  enable_dns_hostnames                 = "false"
  enable_network_address_usage_metrics = "false"
  tags                                 = {}
}

run "validate" {

  command = apply
  assert {
    condition     = aws_vpc.this.cidr_block == "10.0.0.0/16"
    error_message = "cidr block parameter value is not correct"
  }

}
