data "aws_ssm_patch_baseline" "this" {
  owner = var.owner

  default_baseline = var.default_baseline
  name_prefix      = var.name_prefix
  operating_system = var.operating_system
}
