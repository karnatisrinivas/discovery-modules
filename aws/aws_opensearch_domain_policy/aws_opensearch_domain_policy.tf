resource "aws_opensearch_domain_policy" "this" {
  domain_name     = var.domain_name
  access_policies = var.access_policies
}