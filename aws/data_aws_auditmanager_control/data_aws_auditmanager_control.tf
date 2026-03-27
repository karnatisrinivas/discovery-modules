data "aws_auditmanager_control" "this" {
  name = var.name
  type = var.type
}
