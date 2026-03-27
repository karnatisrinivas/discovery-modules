resource "aws_codestarconnections_connection" "this" {
  host_arn      = var.host_arn
  name          = var.name
  provider_type = var.provider_type
  tags          = var.tags

}
