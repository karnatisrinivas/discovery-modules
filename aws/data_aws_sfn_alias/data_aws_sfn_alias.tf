data "aws_sfn_alias" "this" {
  name             = var.name
  statemachine_arn = var.statemachine_arn

  description = var.description
}
