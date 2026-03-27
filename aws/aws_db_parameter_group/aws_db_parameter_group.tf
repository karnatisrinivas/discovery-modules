resource "aws_db_parameter_group" "this" {
  name        = var.name
  name_prefix = var.name == "" ? var.name_prefix : null
  family      = var.family
  description = var.description

  dynamic "parameter" {
    for_each = var.parameter
    content {
      name         = parameter.value.name
      value        = parameter.value.value
      apply_method = parameter.value.apply_method
    }
  }

  skip_destroy = var.skip_destroy
  tags         = var.tags
}
