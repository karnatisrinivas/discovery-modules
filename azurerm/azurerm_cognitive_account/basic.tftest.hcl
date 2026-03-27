variables {
  name                = "test-cognitive-account-ga"
  resource_group_name = "test-cognitive-account-ga"
  location            = "eastus"
  kind                = "Face"
  sku_name            = "S0"
}

run "validate" {
  command = apply
  assert {
    condition     = azurerm_cognitive_account.this.resource_group_name == "test-cognitive-account-ga"
    error_message = "failed to execute plan for cognitive account"
  }
}