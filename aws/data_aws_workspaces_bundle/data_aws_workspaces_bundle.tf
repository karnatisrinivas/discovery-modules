data "aws_workspaces_bundle" "this" {

  bundle_id = var.bundle_id
  name      = var.name
  owner     = var.owner
}
