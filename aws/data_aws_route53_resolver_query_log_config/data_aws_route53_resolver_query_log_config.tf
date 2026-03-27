data "aws_route53_resolver_query_log_config" "this" {

  name                         = var.name
  resolver_query_log_config_id = var.resolver_query_log_config_id
}
