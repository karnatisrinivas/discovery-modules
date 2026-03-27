variables {
  group      = ""
  policy_arn = ""
}
run "test" {
  command = plan
  assert {
    condition     = aws_iam_group_policy_attachment.this.group != null
    error_message = "aws_iam_group_policy_attachment was not succesful"
  }
}
