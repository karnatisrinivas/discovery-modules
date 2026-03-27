data "aws_kms_ciphertext" "this" {
  key_id    = var.key_id
  plaintext = var.plaintext

  context = var.context
}
