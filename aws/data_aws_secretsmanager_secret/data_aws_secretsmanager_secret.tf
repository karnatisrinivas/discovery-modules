data "aws_secretsmanager_secret" "this" {
  arn  = var.arn
  name = var.name
}
