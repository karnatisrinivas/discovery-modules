data "aws_glue_catalog_table" "this" {
  database_name = var.database_name
  name          = var.name

  query_as_of_time = var.query_as_of_time
  transaction_id   = var.transaction_id
}
