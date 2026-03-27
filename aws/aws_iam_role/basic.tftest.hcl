variables {
  region                = "us-east-2"
  env                   = "dev"
  name                  = "test-iam-role"
  description           = "test-iam-role description"
  assume_role_policy    = "{\"Statement\": [{\"Action\": \"sts:AssumeRole\",\"Effect\": \"Allow\",\"Principal\": \"*\",\"Sid\": \"AllowPrinciple\"},{\"Action\": \"sts:AssumeRole\",\"Effect\": \"Allow\",\"Principal\": {\"Service\": \"*\"},\"Sid\": \"AllowService\"}],\"Version\": \"2008-10-17\"}"
  force_detach_policies = false
  path                  = "/"
  max_session_duration  = 3600
  inline_policy = [
    {
      name   = "test-iam-role-policy"
      policy = "{\"Version\": \"2012-10-17\",\"Statement\": [{\"Action\": \"s3:GetObject\",\"Effect\": \"Allow\",\"Resource\": \"*\"}]}"
    }
  ]
  tags = {
    Name = "test-iam-role"
  }
}

run "validate" {

  command = plan
  assert {
    condition     = aws_iam_role.this.name == "test-iam-role"
    error_message = "role name is not correct"
  }

  assert {
    condition     = length(aws_iam_role.this.inline_policy) == 1
    error_message = "inline policy count is not correct"
  }

}
