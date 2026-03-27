resource "aws_secretsmanager_secret_policy" "this" {
  block_public_policy = var.block_public_policy
  policy              = var.policy
  secret_arn          = var.secret_arn

}
