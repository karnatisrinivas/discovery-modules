resource "aws_athena_named_query" "this" {
  name        = var.name
  description = var.description
  query       = var.query
  workgroup   = var.workgroup
  database    = var.database
}