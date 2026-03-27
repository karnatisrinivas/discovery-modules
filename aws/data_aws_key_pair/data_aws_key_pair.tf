data "aws_key_pair" "this" {

  include_public_key = var.include_public_key
  key_name           = var.key_name
  key_pair_id        = var.key_pair_id
}
