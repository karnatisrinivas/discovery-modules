resource "aws_ssm_parameter" "this" {
  name            = var.name
  type            = var.type
  value           = var.value
  tier            = var.tier
  description     = var.description
  data_type       = var.data_type
  allowed_pattern = var.allowed_pattern
  key_id          = var.key_id
  tags            = var.tags
}


