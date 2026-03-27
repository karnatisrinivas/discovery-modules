resource "aws_lambda_permission" "this" {
  action                 = var.action
  function_name          = var.function_name
  function_url_auth_type = var.function_url_auth_type
  principal              = var.principal
  qualifier              = var.qualifier == "" ? null : var.qualifier
  source_account         = var.source_account
  source_arn             = var.source_arn
}

