data "aws_ec2_coip_pools" "this" {

  tags = var.tags
}
