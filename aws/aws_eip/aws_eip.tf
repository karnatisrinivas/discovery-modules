resource "aws_eip" "this" {
  domain                    = var.domain
  address                   = var.address
  associate_with_private_ip = var.associate_with_private_ip
  customer_owned_ipv4_pool  = var.customer_owned_ipv4_pool
  instance                  = var.instance
  network_border_group      = var.network_border_group
  network_interface         = var.network_interface
  public_ipv4_pool          = var.public_ipv4_pool
  tags                      = var.tags
}


