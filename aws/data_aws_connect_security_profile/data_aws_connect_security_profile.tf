data "aws_connect_security_profile" "this" {
  instance_id         = var.instance_id
  name                = var.name
  security_profile_id = var.security_profile_id
}
