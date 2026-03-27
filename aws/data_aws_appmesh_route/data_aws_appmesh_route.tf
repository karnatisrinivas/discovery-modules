data "aws_appmesh_route" "this" {
  mesh_name           = var.mesh_name
  name                = var.name
  virtual_router_name = var.virtual_router_name
}
