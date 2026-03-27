data "aws_shield_protection" "this" {
  protection_id = var.protection_id
  resource_arn  = var.resource_arn
}
