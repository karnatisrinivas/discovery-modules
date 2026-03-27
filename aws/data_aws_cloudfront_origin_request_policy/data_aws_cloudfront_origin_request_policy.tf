data "aws_cloudfront_origin_request_policy" "this" {

  id   = var.id
  name = var.name
}
