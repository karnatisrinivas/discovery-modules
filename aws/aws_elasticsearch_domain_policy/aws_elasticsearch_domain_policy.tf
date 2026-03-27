resource "aws_elasticsearch_domain_policy" "this" {
  access_policies = var.access_policies
  domain_name     = var.domain_name

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
