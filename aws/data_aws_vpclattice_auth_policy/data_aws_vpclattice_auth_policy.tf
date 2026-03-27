data "aws_vpclattice_auth_policy" "this" {
  resource_identifier = var.resource_identifier

  policy = var.policy
  state  = var.state
}
