variables {
  account_alias = "fdasfasf"
}
run "test" {
  command = plan
  assert {
    condition     = aws_iam_account_alias.this.account_alias != null
    error_message = "aws_iam_account_alias was not succesful"
  }
}
