variables {
  domain                 = "application-namespace"
  mail_from_domain       = "mail.application-namespace"
  behavior_on_mx_failure = "RejectMessage"
  region                 = "us-west-2"
}

run "ses_domain_main_from" {
  command = plan
  assert {
    condition     = aws_ses_domain_mail_from.this.domain == "application-namespace"
    error_message = "Domain is not application-namespace"
  }
}

