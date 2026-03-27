data "aws_dx_router_configuration" "this" {
  router_type_identifier = var.router_type_identifier
  virtual_interface_id   = var.virtual_interface_id
}
