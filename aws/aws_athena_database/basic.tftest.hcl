# Define the input variables
variables {
  name   = "example_database"
  bucket = "example_bucket"
  region = "us-east-1"
  acl_configuration = [{
    s3_acl_option = "BUCKET_OWNER_FULL_CONTROL"
  }]
  encryption_configuration = [
    {
      encryption_option = "SSE_KMS"
      kms_key           = "example_kms_key"
    }
  ]
  expected_bucket_owner = "example_bucket_owner"
  force_destroy         = true
}

# Test to validate used variables
run "validate" {
  command = plan

  assert {
    condition     = aws_athena_database.this.name == "example_database"
    error_message = "Expected condition was not met"
  }
}
