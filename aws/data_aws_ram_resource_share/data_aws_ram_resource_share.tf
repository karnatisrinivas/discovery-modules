data "aws_ram_resource_share" "this" {
  resource_owner = var.resource_owner

  resource_share_status = var.resource_share_status
}
