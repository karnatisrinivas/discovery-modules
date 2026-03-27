data "aws_iam_server_certificate" "this" {

  latest      = var.latest
  name_prefix = var.name_prefix
  path_prefix = var.path_prefix
}
