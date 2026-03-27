data "aws_ssm_patch_baselines" "this" {

  default_baselines = var.default_baselines
}
