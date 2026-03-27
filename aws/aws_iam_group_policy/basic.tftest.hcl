variables {
  region = "us-east-1"
  group  = "developers"

  name = "s3_read_only_policy"

  # Uncomment if you prefer to use name_prefix instead of name
  name_prefix = ""

  policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Action\":[\"s3:GetObject\",\"s3:ListBucket\"],\"Resource\":[\"arn:aws:s3:::example-bucket\",\"arn:aws:s3:::example-bucket/*\"]}]}"
}
run "test" {
  command = plan
  assert {
    condition     = aws_iam_group_policy.this.name == var.name
    error_message = "aws_iam_group_policy was not succesful"
  }
}
