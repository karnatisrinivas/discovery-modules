data "aws_network_acls" "this" {

  vpc_id = var.vpc_id
}
