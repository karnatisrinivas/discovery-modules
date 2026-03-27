data "aws_secretsmanager_secret_rotation" "this" {
  secret_id = var.secret_id
}
