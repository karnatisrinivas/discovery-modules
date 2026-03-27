variables {
  bucket                = "bucketname"
  expected_bucket_owner = "012345678901"
  rule = [
    {
      bucket_key_enabled = true
      apply_server_side_encryption_by_default = [
        {
          sse_algorithm     = "aws:kms"
          kms_master_key_id = null
        }
      ]
    }
  ]
}

run "test" {
  command = plan
  assert {
    condition     = aws_s3_bucket_server_side_encryption_configuration.this.bucket == "bucketname"
    error_message = "Test for aws_s3_bucket_server_side_encryption_configuration did not pass."
  }
}