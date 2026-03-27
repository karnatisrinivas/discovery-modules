resource "aws_db_subnet_group" "this" {
  name        = length(var.name) == 0 ? null : var.name
  name_prefix = length(var.name) == 0 && var.name_prefix != null ? var.name_prefix : null
  subnet_ids  = var.subnet_ids
  description = var.description
  tags        = var.tags
}
