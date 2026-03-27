resource "aws_ses_domain_mail_from" "this" {
  domain                 = var.domain
  mail_from_domain       = var.mail_from_domain
  behavior_on_mx_failure = var.behavior_on_mx_failure
}
