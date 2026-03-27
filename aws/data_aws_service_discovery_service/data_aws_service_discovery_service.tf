data "aws_service_discovery_service" "this" {
  name         = var.name
  namespace_id = var.namespace_id

  tags = var.tags
}
