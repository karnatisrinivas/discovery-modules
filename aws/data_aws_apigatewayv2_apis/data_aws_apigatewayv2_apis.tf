data "aws_apigatewayv2_apis" "this" {

  name          = var.name
  protocol_type = var.protocol_type
  tags          = var.tags
}
