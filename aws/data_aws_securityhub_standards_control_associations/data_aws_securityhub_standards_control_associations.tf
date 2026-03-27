data "aws_securityhub_standards_control_associations" "this" {
  security_control_id = var.security_control_id
}
