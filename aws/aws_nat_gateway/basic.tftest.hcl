variables {
  region                             = "us-west-2"
  subnet_id                          = "id.to.subnet"
  allocation_id                      = null
  connectivity_type                  = "private"
  private_ip                         = ""
  secondary_allocation_ids           = null
  secondary_private_ip_address_count = null
  secondary_private_ip_addresses     = ["1.1.1.1", "2.2.2.2", "3.3.3.3"]
  tags                               = {}
  timeouts                           = null
}

run "test" {
  command = plan
  assert {
    condition     = aws_nat_gateway.this.subnet_id == "id.to.subnet"
    error_message = "The test for aws_nat_gateway did not pass"
  }
}