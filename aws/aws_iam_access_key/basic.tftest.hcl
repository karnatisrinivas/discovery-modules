variables {
  user    = "env-management-demos"
  pgp_key = null
  status  = "Active"
}

run "create-iam-access-key" {
  command = apply
  assert {
    condition     = aws_iam_access_key.this.status == "Active"
    error_message = "Error in IAM Access Key creation"
  }
}

