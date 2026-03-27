data "aws_connect_user" "this" {
  instance_id = var.instance_id
  user_id     = var.user_id
  name        = var.name
}
