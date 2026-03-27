variables {
  name       = "test-consumer"
  stream_arn = "arn:aws:kinesis:us-east-2:123456789012:stream/test-stream"
}

provider "aws" {
  region = "us-east-1"
}


run "validate" {
  command = plan
  assert {
    condition     = aws_kinesis_stream_consumer.this.name == "test-consumer"
    error_message = "AWS kinesis stream consumer name is not correct"
  }

}
