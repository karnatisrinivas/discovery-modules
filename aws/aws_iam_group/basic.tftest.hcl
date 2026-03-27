variables {
  name = "somename"
  path = "/path/to/group"
}
run "test" {
  command = plan
  assert {
    condition     = aws_iam_group.this.name != null
    error_message = "aws_iam_group was not succesful"
  }
}
