resource "aws_security_group_rule" "this" {
  security_group_id        = var.security_group_id
  type                     = var.type
  from_port                = var.from_port
  to_port                  = var.to_port
  protocol                 = var.protocol
  description              = var.description
  prefix_list_ids          = var.prefix_list_ids
  cidr_blocks              = (!var.self && var.source_security_group_id == null) ? var.cidr_blocks : null
  ipv6_cidr_blocks         = (!var.self && var.source_security_group_id == null) ? var.ipv6_cidr_blocks : null
  self                     = var.self ? true : null
  source_security_group_id = (!var.self && length(coalesce(var.cidr_blocks, [])) == 0 && length(coalesce(var.ipv6_cidr_blocks, [])) == 0 && var.source_security_group_id != null) ? var.source_security_group_id : null
}