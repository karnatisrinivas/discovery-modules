variables {
  allow_users_to_change_password = false
  minimum_password_length        = 0
}
run "test" {
  command = plan
  assert {
    condition     = aws_iam_account_password_policy.this.allow_users_to_change_password != null
    error_message = "aws_iam_account_password_policy was not succesful"
  }
}
