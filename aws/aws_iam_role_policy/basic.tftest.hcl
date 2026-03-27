variables {
  region = "us-east-2"
  env    = "dev"
  name   = "test-iam-role-policy"
  role   = "test-iam-role"
  policy = "{\"Version\": \"2012-10-17\",\"Statement\": [{\"Action\": \"s3:GetObject\",\"Effect\": \"Allow\",\"Resource\": \"*\"}]}"
}

run "validate" {

  command = plan
  assert {
    condition     = aws_iam_role_policy.this.name == "test-iam-role-policy"
    error_message = "role policy name is not correct"
  }

  assert {
    condition     = aws_iam_role_policy.this.role == "test-iam-role"
    error_message = "policy role name is not correct"
  }

  assert {
    condition     = aws_iam_role_policy.this.policy != ""
    error_message = "policy should not be empty"
  }

}
