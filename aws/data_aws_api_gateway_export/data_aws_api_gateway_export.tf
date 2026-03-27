data "aws_api_gateway_export" "this" {
  export_type = var.export_type
  rest_api_id = var.rest_api_id
  stage_name  = var.stage_name

  accepts    = var.accepts
  parameters = var.parameters
}
