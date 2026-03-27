data "aws_kinesis_stream_consumer" "this" {
  stream_arn = var.stream_arn
}
