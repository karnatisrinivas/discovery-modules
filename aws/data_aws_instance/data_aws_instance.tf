data "aws_instance" "this" {

  get_password_data = var.get_password_data
  get_user_data     = var.get_user_data
  instance_id       = var.instance_id
}
