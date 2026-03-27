data "aws_datazone_environment_blueprint" "this" {
  domain_id = var.domain_id
  managed   = var.managed
  name      = var.name
}
