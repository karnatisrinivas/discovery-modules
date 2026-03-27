variables {
  group = "test"
  name  = "test"
  users = []
}
run "test" {
  command = plan
  assert {
    condition     = aws_iam_group_membership.this.name != null
    error_message = "aws_iam_group_membership was not succesful"
  }
}
