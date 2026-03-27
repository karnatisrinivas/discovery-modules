data "aws_cognito_user_group" "this" {
  name         = var.name
  user_pool_id = var.user_pool_id
}
