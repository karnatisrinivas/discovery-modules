data "aws_s3_objects" "this" {
  bucket = var.bucket

  delimiter     = var.delimiter
  encoding_type = var.encoding_type
  fetch_owner   = var.fetch_owner
  max_keys      = var.max_keys
  prefix        = var.prefix
  request_payer = var.request_payer
  start_after   = var.start_after
}
