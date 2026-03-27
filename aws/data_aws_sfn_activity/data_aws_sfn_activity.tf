data "aws_sfn_activity" "this" {
  arn  = var.arn
  name = var.name
}
