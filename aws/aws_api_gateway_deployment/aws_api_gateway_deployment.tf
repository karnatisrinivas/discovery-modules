resource "aws_api_gateway_deployment" "this" {
  rest_api_id = var.rest_api_id

  description       = var.description
  stage_description = var.stage_description
  stage_name        = var.stage_name
  triggers          = var.triggers
  variables         = var.variables
}
