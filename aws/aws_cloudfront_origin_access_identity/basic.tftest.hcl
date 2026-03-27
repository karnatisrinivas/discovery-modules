variables {
  comment = "This is a comment."
}

run "test" {
  command = plan
  assert {
    condition     = aws_cloudfront_origin_access_identity.this.comment == "This is a comment."
    error_message = "Test for CloudFront Origin Access Identity did not pass."
  }
}