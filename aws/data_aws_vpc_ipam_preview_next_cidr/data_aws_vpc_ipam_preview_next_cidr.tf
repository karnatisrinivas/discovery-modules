data "aws_vpc_ipam_preview_next_cidr" "this" {
  ipam_pool_id = var.ipam_pool_id

  disallowed_cidrs = var.disallowed_cidrs
  netmask_length   = var.netmask_length
}
