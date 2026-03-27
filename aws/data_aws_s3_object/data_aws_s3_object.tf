data "aws_s3_object" "this" {
  bucket = var.bucket
  key    = var.key

  checksum_mode = var.checksum_mode
  range         = var.range
}
