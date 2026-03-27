data "aws_codecatalyst_dev_environment" "this" {
  env_id       = var.env_id
  project_name = var.project_name
  space_name   = var.space_name

  alias      = var.alias
  creator_id = var.creator_id
}
