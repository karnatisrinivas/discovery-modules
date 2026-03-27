variables {
  name                       = "demo1234"
  local_auth_enabled         = true
  public_network_access      = "enabled"
  purge_protection_enabled   = false
  sku                        = "free"
  soft_delete_retention_days = 7
  replica                    = []
  identity                   = []
  encryption                 = []
  tags = {
    environment = "demo"
    project     = "demo"
  }
  timeouts = {
    create = "10m"
    read   = "5m"
    update = "10m"
    delete = "10m"
  }
}

run "test" {
  command = plan
  assert {
    condition     = azurerm_app_configuration.this.name == "demo1234"
    error_message = "The name of the App Configuration is not correct"
  }
}