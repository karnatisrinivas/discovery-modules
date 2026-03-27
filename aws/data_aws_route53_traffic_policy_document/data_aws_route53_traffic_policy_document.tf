data "aws_route53_traffic_policy_document" "this" {

  record_type    = var.record_type
  start_endpoint = var.start_endpoint
  start_rule     = var.start_rule
}
