data "aws_organizations_delegated_services" "this" {
  account_id = var.account_id
}
