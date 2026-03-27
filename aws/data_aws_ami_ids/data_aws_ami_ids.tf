data "aws_ami_ids" "this" {
  owners = var.owners

  executable_users   = var.executable_users
  include_deprecated = var.include_deprecated
  name_regex         = var.name_regex
  sort_ascending     = var.sort_ascending
}
