variables {
  bucket = "my-example-bucket"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::my-example-bucket/*"
    }
  ]
}
POLICY
  region = "us-west-2"
}
run "test" {
  command = plan
  assert {
    condition     = aws_s3_bucket_policy.this.bucket != null
    error_message = "aws_s3_bucket_policy was not succesful"
  }
}
