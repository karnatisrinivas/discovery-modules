resource "aws_api_gateway_rest_api" "this" {
  name = var.name

  body              = var.body
  fail_on_warnings  = var.fail_on_warnings
  parameters        = var.parameters
  put_rest_api_mode = var.put_rest_api_mode
  tags              = var.tags
}
