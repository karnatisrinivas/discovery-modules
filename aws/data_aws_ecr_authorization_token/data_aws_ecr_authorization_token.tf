data "aws_ecr_authorization_token" "this" {

  registry_id = var.registry_id
}
