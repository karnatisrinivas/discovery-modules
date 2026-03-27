resource "aws_redshift_authentication_profile" "this" {
  count                          = var.authentication_profile_name != null ? 1 : 0
  authentication_profile_name    = var.authentication_profile_name
  authentication_profile_content = var.authentication_profile_content
}