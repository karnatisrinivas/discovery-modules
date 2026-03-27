data "aws_instances" "this" {

  instance_state_names = var.instance_state_names
}
