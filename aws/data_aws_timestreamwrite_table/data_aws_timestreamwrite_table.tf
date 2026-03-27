data "aws_timestreamwrite_table" "this" {
  database_name = var.database_name
  name          = var.name
}
