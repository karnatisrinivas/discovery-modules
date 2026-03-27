resource "aws_codecommit_repository" "this" {
  default_branch  = var.default_branch
  description     = var.description
  kms_key_id      = var.kms_key_id
  repository_name = var.repository_name
  tags            = var.tags

}
