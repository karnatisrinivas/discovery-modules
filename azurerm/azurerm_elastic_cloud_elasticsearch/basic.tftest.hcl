variables {
  name                        = "test-elasticsearch-ga"
  location                    = "eastus"
  resource_group_name         = "test-resourcegroup-ga"
  sku_name                    = "ess-consumption-2024_Monthly"
  elastic_cloud_email_address = "YOUR AZURE PORTAL EMAIL HERE"
}

run "test" {
  command = apply
  assert {
    condition     = azurerm_elastic_cloud_elasticsearch.this.name == "test-elasticsearch-ga"
    error_message = "The DNS zone name is incorrect"
  }
}