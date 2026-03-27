data "aws_quicksight_user" "this" {
  user_name = var.user_name

  namespace = var.namespace
}
