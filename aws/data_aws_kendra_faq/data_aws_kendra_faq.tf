data "aws_kendra_faq" "this" {
  faq_id   = var.faq_id
  index_id = var.index_id
}
