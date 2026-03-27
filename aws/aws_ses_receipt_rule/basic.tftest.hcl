variables {
  region            = "us-east-1"
  name              = "test"
  rule_set_name     = "test"
  enabled           = true
  recipients        = ["test@test.com"]
  scan_enabled      = true
  tls_policy        = "Optional"
  after             = null
  add_header_action = []
  bounce_action     = []
  lambda_action     = []
  s3_action         = []
  sns_action        = []
  stop_action       = []
  workmail_action   = []
}

run "ses_rule_test" {
  command = plan
  assert {
    condition     = aws_ses_receipt_rule.this.name == "test"
    error_message = "SES rule name should be test"
  }
}
