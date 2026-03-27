resource "aws_efs_file_system_policy" "this" {
  bypass_policy_lockout_safety_check = var.bypass_policy_lockout_safety_check
  file_system_id                     = var.file_system_id
  policy                             = var.policy

}
