data "aws_codeartifact_authorization_token" "this" {
  domain = var.domain

  duration_seconds = var.duration_seconds
}
