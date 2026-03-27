data "aws_organizations_policies_for_target" "this" {
  filter    = var.filter
  target_id = var.target_id
}
