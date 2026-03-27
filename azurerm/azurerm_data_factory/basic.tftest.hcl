variables {
  location               = "eastus"
  resource_group_name    = "example-resources-df"
  name                   = "example-df-ga"
  public_network_enabled = true
  identity_type          = "SystemAssigned"
  identity_ids           = []
}

run "test" {
  command = apply
  assert {
    condition     = azurerm_data_factory.this.name == "example-df-ga"
    error_message = "Test did not pass."
  }
}