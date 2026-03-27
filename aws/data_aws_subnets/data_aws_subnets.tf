data "aws_subnets" "this" {
  tags = var.tags
  dynamic "filter" {
    for_each = coalesce(var.filter, [])
    content {
      name   = filter.value.name
      values = filter.value.values
    }
  }
}
