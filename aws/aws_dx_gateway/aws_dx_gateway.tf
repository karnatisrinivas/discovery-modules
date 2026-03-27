resource "aws_dx_gateway" "this" {
  amazon_side_asn = var.amazon_side_asn
  name            = var.name

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

}
