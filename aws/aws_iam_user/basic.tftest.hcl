variables {
  name                 = "loadbalancer"
  path                 = "/system/"
  permissions_boundary = "asd"
  force_destroy        = true
  tags                 = {}
}

run "test" {
  command = plan
  assert {
    condition     = aws_iam_user.this.name == "loadbalancer"
    error_message = "The test for AWS IAM User did not pass"
  }
}