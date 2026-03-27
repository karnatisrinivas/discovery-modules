data "aws_quicksight_group" "this" {
  group_name = var.group_name

  namespace = var.namespace
}
