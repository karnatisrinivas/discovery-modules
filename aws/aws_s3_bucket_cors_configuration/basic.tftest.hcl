variables {
  bucket_name = "sample-test-bucket-cors-config"
  cors_rule   = [{ "allowed_headers" = ["Content-Type"], "allowed_methods" = ["HEAD", "PUT"], "allowed_origins" = ["*"], "max_age_seconds" = 300, "expose_headers" = ["x-custom-header"] }]
}

run "validate" {
  command = plan
  assert {
    condition     = aws_s3_bucket_cors_configuration.this.bucket == "sample-test-bucket-cors-config"
    error_message = "CORS configuration is not correct."
  }
}