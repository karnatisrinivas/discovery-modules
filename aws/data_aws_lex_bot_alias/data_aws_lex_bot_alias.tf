data "aws_lex_bot_alias" "this" {
  bot_name = var.bot_name
  name     = var.name
}
