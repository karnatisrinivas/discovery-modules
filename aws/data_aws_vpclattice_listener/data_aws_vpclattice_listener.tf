data "aws_vpclattice_listener" "this" {
  listener_identifier = var.listener_identifier
  service_identifier  = var.service_identifier
}
