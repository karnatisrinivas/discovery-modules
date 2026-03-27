data "aws_servicecatalog_constraint" "this" {
  id = var.id

  accept_language = var.accept_language
}
