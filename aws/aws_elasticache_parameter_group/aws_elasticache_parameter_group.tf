resource "aws_elasticache_parameter_group" "this" {
  name        = var.name
  family      = var.family
  description = var.description
  dynamic "parameter" {
    for_each = var.parameter
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }
  tags = var.tags
}



