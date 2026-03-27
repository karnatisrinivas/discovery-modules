data "aws_vpc_ipam_pool" "this" {

  id           = var.id
  ipam_pool_id = var.ipam_pool_id
}
