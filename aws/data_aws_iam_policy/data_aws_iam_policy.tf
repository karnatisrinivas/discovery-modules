data "aws_iam_policy" "this" {
  arn         = var.arn != "" ? var.arn : null
  name        = var.arn == "" && var.name != "" ? var.name : null
  path_prefix = var.arn == "" ? var.path_prefix : null
}
