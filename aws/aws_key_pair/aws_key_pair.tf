resource "aws_key_pair" "this" {
  public_key      = var.public_key
  key_name        = var.key_name == "" ? null : var.key_name
  key_name_prefix = var.key_name_prefix == "" ? null : var.key_name_prefix
  tags            = var.tags
}
