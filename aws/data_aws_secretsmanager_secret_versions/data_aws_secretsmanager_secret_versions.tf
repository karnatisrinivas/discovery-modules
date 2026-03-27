data "aws_secretsmanager_secret_versions" "this" {
  secret_id = var.secret_id

  include_deprecated = var.include_deprecated
}
