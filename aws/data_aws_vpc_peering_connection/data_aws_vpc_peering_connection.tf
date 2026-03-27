data "aws_vpc_peering_connection" "this" {
  vpc_id          = var.vpc_id
  peer_cidr_block = var.peer_cidr_block
}
