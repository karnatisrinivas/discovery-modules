data "aws_servicecatalog_provisioning_artifacts" "this" {
  product_id = var.product_id

  accept_language = var.accept_language
}
