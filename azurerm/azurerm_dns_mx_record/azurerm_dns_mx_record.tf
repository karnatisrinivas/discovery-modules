resource "azurerm_dns_mx_record" "record" {
  name                = var.name
  zone_name           = var.zone_name
  resource_group_name = var.resource_group_name
  ttl                 = var.ttl

  dynamic "record" {
    for_each = var.records
    iterator = record
    content {
      preference = record.value["preference"]
      exchange   = record.value["exchange"]
    }
  }
}

