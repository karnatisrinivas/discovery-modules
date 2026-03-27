resource "aws_iam_server_certificate" "this" {
  name              = var.name
  name_prefix       = var.name != null ? null : var.name_prefix
  certificate_body  = var.certificate_body
  private_key       = var.private_key
  certificate_chain = var.certificate_chain
  path              = var.path
  tags              = var.tags

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      delete = lookup(timeouts.value, "delete", null)
    }
  }
}
