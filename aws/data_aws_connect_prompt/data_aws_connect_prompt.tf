data "aws_connect_prompt" "this" {
  instance_id = var.instance_id
  name        = var.name
}
