data "aws_connect_instance" "this" {
  instance_id    = var.instance_id
  instance_alias = var.instance_alias
}
