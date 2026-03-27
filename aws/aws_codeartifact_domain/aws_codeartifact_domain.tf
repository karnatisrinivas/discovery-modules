resource "aws_codeartifact_domain" "this" {
  domain         = var.domain
  encryption_key = var.encryption_key
  tags           = var.tags

}
