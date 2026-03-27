data "aws_ami" "this" {

  executable_users   = var.executable_users
  include_deprecated = var.include_deprecated
  most_recent        = var.most_recent
  name_regex         = var.name_regex
  owners             = var.owners
}
