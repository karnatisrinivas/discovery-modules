variables {
  region      = "us-east-2"
  env         = "dev"
  name        = "test-iam-policy"
  description = "test-iam-policy-description"
  path        = "/"
  policy      = "{\"Version\": \"2012-10-17\",\"Statement\": [{\"Action\": \"s3:GetObject\",\"Effect\": \"Allow\",\"Resource\": \"*\"}]}"
  tags = {
    Environment = "dev"
  }
}

run "validate" {

  command = plan
  assert {
    condition     = aws_iam_policy.this.name == "test-iam-policy"
    error_message = "role policy name is not correct"
  }

  assert {
    condition     = aws_iam_policy.this.description == "test-iam-policy-description"
    error_message = "role policy description is not correct"
  }
}
