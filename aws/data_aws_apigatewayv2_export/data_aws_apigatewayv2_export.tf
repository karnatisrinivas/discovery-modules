data "aws_apigatewayv2_export" "this" {
  api_id        = var.api_id
  output_type   = var.output_type
  specification = var.specification

  export_version     = var.export_version
  include_extensions = var.include_extensions
  stage_name         = var.stage_name
}
