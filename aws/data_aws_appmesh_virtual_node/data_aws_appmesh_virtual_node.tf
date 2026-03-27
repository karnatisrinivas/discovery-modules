data "aws_appmesh_virtual_node" "this" {
  mesh_name = var.mesh_name
  name      = var.name
}
