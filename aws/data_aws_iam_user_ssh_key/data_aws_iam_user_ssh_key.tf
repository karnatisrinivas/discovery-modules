data "aws_iam_user_ssh_key" "this" {
  encoding          = var.encoding
  ssh_public_key_id = var.ssh_public_key_id
  username          = var.username
}
