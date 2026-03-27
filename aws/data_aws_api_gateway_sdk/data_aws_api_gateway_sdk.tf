data "aws_api_gateway_sdk" "this" {
  rest_api_id = var.rest_api_id
  sdk_type    = var.sdk_type
  stage_name  = var.stage_name

  parameters = var.parameters
}
