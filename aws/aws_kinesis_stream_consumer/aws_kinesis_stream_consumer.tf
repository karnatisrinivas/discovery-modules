resource "aws_kinesis_stream_consumer" "this" {
  name       = var.name
  stream_arn = var.stream_arn
}



