resource "azurerm_elastic_cloud_elasticsearch" "this" {
  name                        = var.name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  sku_name                    = var.sku_name
  elastic_cloud_email_address = var.elastic_cloud_email_address
}

