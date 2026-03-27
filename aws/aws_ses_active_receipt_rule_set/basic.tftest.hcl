variables {
  rule_set_name = "test-rule-set"
  region        = "us-west-2"
}

run "test" {
  command = plan
  assert {
    condition     = aws_ses_active_receipt_rule_set.this.rule_set_name == "test-rule-set"
    error_message = "Rule set name does not match"
  }
}