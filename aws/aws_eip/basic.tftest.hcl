variables {
  domain                    = "vpc"
  address                   = "0.0.0.0"
  associate_with_private_ip = "1.1.1.1"
  customer_owned_ipv4_pool  = "2.2.2.2"
  instance                  = "ec2.instance.id"
  network_border_group      = "us-east-1"
  network_interface         = "3.3.3.3"
  public_ipv4_pool          = null
  tags                      = {}
}

run "test" {
  command = plan
  assert {
    condition     = aws_eip.this.instance == "ec2.instance.id"
    error_message = "Test for AWS EIP did not pass."
  }
}