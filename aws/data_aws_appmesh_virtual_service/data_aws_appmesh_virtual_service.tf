data "aws_appmesh_virtual_service" "this" {
  mesh_name = var.mesh_name
  name      = var.name
}
