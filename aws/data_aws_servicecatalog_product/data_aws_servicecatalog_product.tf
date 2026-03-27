data "aws_servicecatalog_product" "this" {
  id = var.id

  accept_language = var.accept_language
}
