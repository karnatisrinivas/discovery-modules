data "aws_glue_data_catalog_encryption_settings" "this" {
  catalog_id = var.catalog_id
}
