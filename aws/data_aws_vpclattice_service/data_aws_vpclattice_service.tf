data "aws_vpclattice_service" "this" {
  name               = var.name
  service_identifier = var.service_identifier
}
