data "aws_dynamodb_table_item" "this" {
  key        = var.key
  table_name = var.table_name

  expression_attribute_names = var.expression_attribute_names
  projection_expression      = var.projection_expression
}
