variables {
  subscription_id               = "12345678-1234-9876-4563-123456789012"
  create_resource_group         = "false"
  resource_group_name           = "example-rg-secondary"
  name                          = "monitorworkspace-ga"
  location                      = "eastus"
  public_network_access_enabled = false
}

run "mode_point_in_time_restore" {
  command = apply
  assert {
    condition     = azurerm_monitor_workspace.this.name == "monitorworkspace-ga"
    error_message = "Azure monitor is not correct"
  }
}
