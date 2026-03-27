variables {
  subscription_id                                = "12345678-1234-9876-4563-123456789012"
  create_resource_group                          = false
  location                                       = "eastus"
  storage_uses_managed_identity                  = null
  virtual_network_subnet_id                      = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/my-rg/providers/Microsoft.Network/virtualNetworks/my-vnet/subnets/my-subnet"
  client_certificate_mode                        = "Optional"
  ftp_publish_basic_authentication_enabled       = false
  https_only                                     = false
  name                                           = "test-app"
  public_network_access_enabled                  = false
  storage_account_access_key                     = "test"
  webdeploy_publish_basic_authentication_enabled = false
  client_certificate_enabled                     = false
  content_share_force_disabled                   = false
  daily_memory_time_quota                        = 0
  functions_extension_version                    = "~4"
  builtin_logging_enabled                        = false
  storage_account_name                           = "teststorageaccount"
  storage_key_vault_secret_id                    = null
  tags = {
    "rest" = "test"
  }
  resource_group_name                = "testgrp"
  service_plan_id                    = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-rg/providers/Microsoft.Web/serverFarms/linux-fn-test-app"
  app_settings                       = {}
  client_certificate_exclusion_paths = "/"
  enabled                            = false
}
run "test" {
  command = plan
  assert {
    condition     = azurerm_linux_function_app.this.name != null
    error_message = "azurerm_linux_function_app was not succesful"
  }
}
