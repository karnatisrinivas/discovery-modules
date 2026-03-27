resource "aws_iam_group_policy" "this" {
  group       = var.group
  name        = var.name == "" ? null : var.name
  name_prefix = var.name_prefix == "" ? null : var.name_prefix
  policy      = var.policy

}
