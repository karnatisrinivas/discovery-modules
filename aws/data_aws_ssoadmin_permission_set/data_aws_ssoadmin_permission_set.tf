data "aws_ssoadmin_permission_set" "this" {
  instance_arn = var.instance_arn
  arn          = var.arn
  name         = var.name
}
