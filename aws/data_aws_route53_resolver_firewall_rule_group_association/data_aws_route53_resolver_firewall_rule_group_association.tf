data "aws_route53_resolver_firewall_rule_group_association" "this" {
  firewall_rule_group_association_id = var.firewall_rule_group_association_id
}
