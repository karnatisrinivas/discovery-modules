data "aws_appmesh_virtual_gateway" "this" {
  mesh_name = var.mesh_name
  name      = var.name
}
