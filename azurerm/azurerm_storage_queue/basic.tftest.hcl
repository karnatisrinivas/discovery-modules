variables {
  subscription_id       = "12345678-1234-9876-4563-123456789012"
  location              = "eastus"
  resource_group_name   = "example-rg"
  create_resource_group = false

  # Name of the storage queue
  name = "quque1"

  # Name of the storage account
  storage_account_name = "4fafae20storage"

  # Metadata for the storage queue (map of key-value pairs)
  metadata = {}
}


run "validate" {
  command = apply
  assert {
    condition     = azurerm_storage_queue.this.name == var.name
    error_message = "Azure storage queue name is not correct"
  }

}
