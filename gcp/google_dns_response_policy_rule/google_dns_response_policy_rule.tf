resource "google_dns_response_policy_rule" "this" {
  dns_name        = var.dns_name
  response_policy = var.response_policy
  rule_name       = var.rule_name

  dynamic "local_data" {
    for_each = var.local_data
    content {
      dynamic "local_datas" {
        for_each = local_data.value.local_datas
        content {
          name    = local_datas.value.name
          rrdatas = local_datas.value.rrdatas
          ttl     = local_datas.value.ttl
          type    = local_datas.value.type
        }
      }

    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
