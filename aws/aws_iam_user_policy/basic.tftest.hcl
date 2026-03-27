variables {
  name        = "this is a user policy"
  name_prefix = null
  user        = "some guy"
  policy      = "{\n\"Version\": \"2012-10-17\",\n\"Statement\": [\n{\n\"Action\": [\n\"ec2:Describe*\"\n],\n\"Effect\": \"Allow\",\n\"Resource\": \"*\"\n}\n]\n}"
}

run "test" {
  command = plan
  assert {
    condition     = aws_iam_user_policy.this.name == "this is a user policy"
    error_message = "The test for AWS IAM User Policy did not pass."
  }
}