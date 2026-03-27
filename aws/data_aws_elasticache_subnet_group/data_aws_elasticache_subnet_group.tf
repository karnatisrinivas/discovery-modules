data "aws_elasticache_subnet_group" "this" {
  name = var.name

  tags = var.tags
}
