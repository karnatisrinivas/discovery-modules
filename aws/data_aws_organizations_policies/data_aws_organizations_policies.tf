data "aws_organizations_policies" "this" {
  filter = var.filter
}
