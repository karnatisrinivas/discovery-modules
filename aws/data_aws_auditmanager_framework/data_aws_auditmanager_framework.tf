data "aws_auditmanager_framework" "this" {
  framework_type = var.framework_type
  name           = var.name
}
