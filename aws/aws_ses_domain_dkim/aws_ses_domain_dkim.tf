resource "aws_ses_domain_dkim" "this" {
  domain = var.domain
}