data "aws_lakeformation_permissions" "this" {
  principal = var.principal

  catalog_id       = var.catalog_id
  catalog_resource = var.catalog_resource
}
