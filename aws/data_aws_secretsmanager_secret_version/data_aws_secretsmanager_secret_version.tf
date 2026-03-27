data "aws_secretsmanager_secret_version" "this" {
  secret_id = var.secret_id

  version_stage = var.version_stage
}
