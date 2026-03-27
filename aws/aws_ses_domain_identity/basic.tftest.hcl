variables {
  domain = "example.com"
}

run "test" {
  command = plan
  assert {
    condition     = aws_ses_domain_identity.this.domain == "example.com"
    error_message = "The test for AWS SES Domain Identity did not pass."
  }
}