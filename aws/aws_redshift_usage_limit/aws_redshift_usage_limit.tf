resource "aws_redshift_usage_limit" "this" {
  cluster_identifier = var.cluster_identifier
  feature_type       = var.feature_type
  limit_type         = var.limit_type
  amount             = var.amount
  breach_action      = var.breach_action
  period             = var.period
  tags               = var.tags
}

