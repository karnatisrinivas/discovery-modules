data "aws_connect_user_hierarchy_group" "this" {
  instance_id        = var.instance_id
  hierarchy_group_id = var.hierarchy_group_id
  name               = var.name
}
