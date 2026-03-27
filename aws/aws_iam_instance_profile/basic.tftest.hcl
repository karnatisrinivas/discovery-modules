variables {
  name        = null
  name_prefix = "myprefix"
  path        = null
  role        = "myrole"
  tags        = null
}

run "test" {
  command = plan
  assert {
    condition     = aws_iam_instance_profile.this.role == "myrole"
    error_message = "Test for aws_iam_instance_profile did not pass."
  }
}