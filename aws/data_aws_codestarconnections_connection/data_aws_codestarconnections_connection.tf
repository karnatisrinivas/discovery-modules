data "aws_codestarconnections_connection" "this" {
  arn  = var.arn
  name = var.name
}
