data "aws_kms_custom_key_store" "this" {
  custom_key_store_name = var.custom_key_store_name
}
