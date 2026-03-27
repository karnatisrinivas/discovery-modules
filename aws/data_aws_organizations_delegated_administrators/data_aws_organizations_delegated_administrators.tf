data "aws_organizations_delegated_administrators" "this" {

  service_principal = var.service_principal
}
