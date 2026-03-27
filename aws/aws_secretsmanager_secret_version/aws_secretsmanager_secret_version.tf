resource "aws_secretsmanager_secret_version" "this" {
  secret_id      = var.secret_id
  secret_string  = var.secret_string
  version_stages = var.version_stages
}