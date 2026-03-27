resource "aws_cloudfront_origin_access_control" "this" {
  description                       = var.description
  name                              = var.name
  origin_access_control_origin_type = var.origin_access_control_origin_type
  signing_behavior                  = var.signing_behavior
  signing_protocol                  = var.signing_protocol

}
