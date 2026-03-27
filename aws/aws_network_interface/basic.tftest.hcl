variables {
  subnet_id                 = "subnet_id"
  description               = "this is a network interface"
  interface_type            = "efa"
  ipv4_prefix_count         = 2
  ipv4_prefixes             = null
  ipv6_address_count        = 2
  ipv6_address_list_enabled = true
  ipv6_address_list         = null
  ipv6_addresses            = null
  ipv6_prefix_count         = 2
  ipv6_prefixes             = null
  private_ip_list           = null
  private_ip_list_enabled   = false
  private_ips               = ["0.0.0.0", "1.1.1.1"]
  private_ips_count         = 2
  security_groups           = ["sg_id_1"]
  source_dest_check         = true
  tags                      = {}

  attachment = [
    {
      instance     = "instance_id"
      device_index = 1
    }
  ]
}

run "test" {
  command = plan
  assert {
    condition     = aws_network_interface.this.subnet_id == "subnet_id"
    error_message = "The test for aws_network_interface did not pass"
  }
}