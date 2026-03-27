data "aws_elasticache_user" "this" {
  user_id = var.user_id

  access_string        = var.access_string
  engine               = var.engine
  no_password_required = var.no_password_required
  passwords            = var.passwords
  user_name            = var.user_name
}
