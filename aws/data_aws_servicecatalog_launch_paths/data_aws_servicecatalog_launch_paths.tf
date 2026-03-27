data "aws_servicecatalog_launch_paths" "this" {
  product_id = var.product_id

  accept_language = var.accept_language
}
