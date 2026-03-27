data "aws_route53_resolver_firewall_rules" "this" {
  firewall_rule_group_id = var.firewall_rule_group_id

  action   = var.action
  priority = var.priority
}
