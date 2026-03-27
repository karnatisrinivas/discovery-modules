variables {
  domain = "example.com"
}

run "test" {
  command = plan
  assert {
    condition     = aws_ses_domain_dkim.this.domain == "example.com"
    error_message = "The test for AWS SES Domain DKIM did not pass."
  }
}