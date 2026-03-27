data "aws_appmesh_gateway_route" "this" {
  mesh_name            = var.mesh_name
  name                 = var.name
  virtual_gateway_name = var.virtual_gateway_name
}
