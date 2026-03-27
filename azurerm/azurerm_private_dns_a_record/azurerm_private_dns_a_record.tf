resource "azurerm_private_dns_a_record" "this" {
  name                = var.name
  records             = var.records
  resource_group_name = var.resource_group_name
  ttl                 = var.ttl
  zone_name           = var.zone_name

  tags = var.tags
}
