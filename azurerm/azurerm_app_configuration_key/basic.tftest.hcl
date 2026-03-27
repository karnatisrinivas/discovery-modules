variables {
  content_type = "text/plain"
  etag         = "1234567890"
  key          = "demo"
  label        = "demo"
  locked       = false
  tags = {
    environment = "demo"
    project     = "demo"
  }
  configuration_store_id = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-azure-rg/providers/Microsoft.AppConfiguration/configurationStores/configurationStoreValue"
  type                   = "kv"
  value                  = "demo"
  timeouts = {
    create = "10m"
    read   = "5m"
    update = "10m"
    delete = "10m"
  }
  vault_key_reference = ""
}

run "test" {
  command = plan
  assert {
    condition     = azurerm_app_configuration_key.this.key == "demo"
    error_message = "The name of the App Configuration Key is not correct"
  }
}