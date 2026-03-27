variables {
  region     = "us-east-2"
  env        = "dev"
  role       = "test-iam-role"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

run "validate" {

  command = plan
  assert {
    condition     = aws_iam_role_policy_attachment.this.role == "test-iam-role"
    error_message = "role policy name is not correct"
  }

  assert {
    condition     = aws_iam_role_policy_attachment.this.policy_arn == "arn:aws:iam::aws:policy/AmazonS3FullAccess"
    error_message = "policy arn name is not correct"
  }

}
