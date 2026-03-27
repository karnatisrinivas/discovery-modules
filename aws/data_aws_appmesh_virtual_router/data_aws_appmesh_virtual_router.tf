data "aws_appmesh_virtual_router" "this" {
  mesh_name = var.mesh_name
  name      = var.name
}
