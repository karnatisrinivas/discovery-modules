resource "aws_ram_resource_share" "this" {
  allow_external_principals = var.allow_external_principals
  name                      = var.name
  permission_arns           = var.permission_arns
  tags                      = var.tags

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

}
