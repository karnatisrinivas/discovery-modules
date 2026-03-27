resource "aws_mq_configuration" "this" {
  description    = var.description
  name           = var.name
  engine_type    = var.engine_type
  engine_version = var.engine_version

  data                    = var.data
  authentication_strategy = var.authentication_strategy
  tags                    = var.tags
}



