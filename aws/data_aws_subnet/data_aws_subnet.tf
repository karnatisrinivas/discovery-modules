data "aws_subnet" "this" {
  id     = var.id
  vpc_id = var.vpc_id
}
