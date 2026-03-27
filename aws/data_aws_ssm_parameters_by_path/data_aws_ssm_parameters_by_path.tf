data "aws_ssm_parameters_by_path" "this" {
  path = var.path

  recursive       = var.recursive
  with_decryption = var.with_decryption
}
