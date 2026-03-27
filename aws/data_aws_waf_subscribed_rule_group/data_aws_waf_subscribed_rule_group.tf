data "aws_waf_subscribed_rule_group" "this" {

  metric_name = var.metric_name
  name        = var.name
}
