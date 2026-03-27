data "aws_s3_bucket_object" "this" {
  bucket = var.bucket
  key    = var.key

  range = var.range
}
