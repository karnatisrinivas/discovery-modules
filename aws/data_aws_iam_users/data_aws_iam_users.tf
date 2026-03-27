data "aws_iam_users" "this" {

  name_regex  = var.name_regex
  path_prefix = var.path_prefix
}
