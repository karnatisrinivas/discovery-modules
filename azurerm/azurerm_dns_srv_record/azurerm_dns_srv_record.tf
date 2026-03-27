resource "azurerm_dns_srv_record" "record" {
  name                = var.name
  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name
  ttl                 = var.ttl

  dynamic "record" {
    for_each = var.records
    iterator = record
    content {
      priority = record.value["priority"]
      weight   = record.value["weight"]
      port     = record.value["port"]
      target   = record.value["target"]

    }
  }
}

