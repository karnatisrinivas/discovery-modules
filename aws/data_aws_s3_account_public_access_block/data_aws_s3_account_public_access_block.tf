data "aws_s3_account_public_access_block" "this" {

  account_id = var.account_id
}
