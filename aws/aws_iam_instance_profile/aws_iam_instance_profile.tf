resource "aws_iam_instance_profile" "this" {
  name        = var.name != "" && var.name_prefix == "" ? var.name : null
  name_prefix = var.name != "" && var.name_prefix != "" ? var.name_prefix : null
  path        = var.path
  role        = var.role
  tags        = var.tags
}
