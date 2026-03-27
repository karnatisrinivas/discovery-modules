data "aws_codeartifact_repository_endpoint" "this" {
  domain     = var.domain
  format     = var.format
  repository = var.repository
}
