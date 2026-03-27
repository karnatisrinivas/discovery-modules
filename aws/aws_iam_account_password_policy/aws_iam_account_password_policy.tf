resource "aws_iam_account_password_policy" "this" {

  allow_users_to_change_password = var.allow_users_to_change_password
  minimum_password_length        = var.minimum_password_length
}
